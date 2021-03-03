#!/usr/bin/env python
# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Trayectorias en tiempo real Rviz

###############################################
####### [Importar Librerias] ##################
###############################################
import pd_tm1_adams
import codos_tm1_adams
import roslib
import rospy
import std_msgs.msg

################################################
######## [Importar mensajes] ###################
################################################
from sensor_msgs.msg import JointState
from simu_visual.msg import angulo
from simu_visual.msg import posicionxyz
from simu_visual.msg import matriz_path_ls

###############################################
########### [Parametros] ######################
###############################################
pi = pd_tm1_adams.pi()
dtr = pd_tm1_adams.dtr()
mmtm = pd_tm1_adams.mmtm()


###############################################
###### [ Funcion Principal] ###################
###############################################
# |----------------------------|
# |----------- Nodo -----------| 
# |----------------------------|
def nodo():
    ###### {{{ Callback Recibe datos }}} ######
    global permiso
    global id_call
    global x_m
    global y_m
    global z_m
    global theta1_m
    global theta2_m
    global theta3_m
    global t_m

    juntas = JointState()
    permiso = False
    id_call = 0
    id_permiso = 0

    ###### {{{ Inicio Nodo }}} ######
    rospy.init_node("posicionador_rviz_realtime_tm1", anonymous=False)
    rate = rospy.Rate(7.8125)  # Hz

    ###### {{{ Publisher }}} ######
    pub = rospy.Publisher("joint_states", JointState, queue_size=10)

    while not rospy.is_shutdown():
        ###### {{{ Topics }}} ######
        rospy.Subscriber("m_txyzth123", matriz_path_ls, callback)

        if permiso == True and id_call != id_permiso:
            rospy.loginfo("Creando Trayectoria Linear RVIZ !")
            largo = len(t_m)

            # Punto inicial
            juntas = angulos_eulerianos(1,
                                        x_m[0], y_m[0], z_m[0],
                                        theta1_m[0], theta2_m[0], theta3_m[0])
            delta = 1
            rospy.sleep(delta)
            pub.publish(juntas)

            for i in range(1, largo):
                juntas = angulos_eulerianos(t_m[i],
                                            x_m[i], y_m[i], z_m[i],
                                            theta1_m[i], theta2_m[i], theta3_m[i])
                delta = t_m[i] - t_m[i - 1]
                rospy.sleep(delta)
                pub.publish(juntas)

            ####### {{{ Reset variable mensaje entrante }}} ######
            permiso = False
            id_permiso = id_call

        rate.sleep()


###############################################
########### [ Otras Funciones] ################
###############################################
# |--------------------------------------|
# |----------- Angulos Juntas -----------| 
# |--------------------------------------|
def angulos_eulerianos(ti,
                       xi, yi, zi,
                       th1, th2, th3):
    # Rviz angulos interiores en Radianes
    joint = JointState()
    punto = [-yi * mmtm, -xi * mmtm, -zi * mmtm]

    c2 = codos_tm1_adams.punto_codo(th2)
    p2 = codos_tm1_adams.punto_ee(punto, 2)
    [a2_a, a2_b] = codos_tm1_adams.angulos_codo(c2, p2, 2)

    c3 = codos_tm1_adams.punto_codo(th3)
    c3 = codos_tm1_adams.rotacion120(c3)
    p3 = codos_tm1_adams.punto_ee(punto, 3)
    [a3_a, a3_b] = codos_tm1_adams.angulos_codo(c3, p3, 3)

    c1 = codos_tm1_adams.punto_codo(th1)
    c1 = codos_tm1_adams.rotacion120(c1)
    c1 = codos_tm1_adams.rotacion120(c1)
    p1 = codos_tm1_adams.punto_ee(punto, 1)
    [a1_a, a1_b] = codos_tm1_adams.angulos_codo(c1, p1, 1)

    # Datos para publicar en Rviz
    joint.header = std_msgs.msg.Header()
    joint.header.stamp = rospy.Time.now()

    joint.name = ["base_brazo1", "base_brazo2", "base_brazo3",
                  "codo1_a", "codo1_b",
                  "codo2_a", "codo2_b",
                  "codo3_a", "codo3_b",
                  "act_x", "act_y", "act_z"]

    joint.position = [th1 * dtr, th2 * dtr, th3 * dtr,
                      th1 * dtr + a1_a, a1_b,
                      th2 * dtr + a2_a, a2_b,
                      th3 * dtr + a3_a, a3_b,
                      xi / 1000, yi / 1000, zi / 1000]

    joint.velocity = []
    joint.effort = []

    return joint


###############################################
########### [ Callback] #######################
###############################################
# |---------------------------------------------|
# |----------- Recibe datos matrices -----------| 
# |---------------------------------------------|
def callback(data):
    global permiso
    global id_call
    global x_m
    global y_m
    global z_m
    global theta1_m
    global theta2_m
    global theta3_m
    global t_m

    permiso = data.permiso
    id_call = data.id_call
    x_m = data.x
    y_m = data.y
    z_m = data.z
    theta1_m = data.th1
    theta2_m = data.th2
    theta3_m = data.th3
    t_m = data.tiempo


###############################################
######## [ Main Funtion] ######################
###############################################
if __name__ == "__main__":
    try:
        nodo()
    except rospy.ROSInterruptException:
        pass

############### FIN #################
