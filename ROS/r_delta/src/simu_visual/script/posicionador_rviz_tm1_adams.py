#!/usr/bin/env python

#Nombre Creador: Ivan Alejandro Fernandez Gracia
#Universidad: Universidad de Santiago de Chile
#Mail: ivan.fernandez.g@usach.cl
#Objetivo: Simulacion de robot delta en Rviz
#Fuentes:

#Importar Librerias
import delta_kinematics_t1m_adams
import delta_kinematics_Paderborn_tm1_adams
import pd_tm1_adams
import codos_tm1_adams
import roslib
import rospy
import jacobian_tm1_adams
#import jacobian_Paderborn_tm1
import numpy as np

#Importar mensajes
import std_msgs.msg
from sensor_msgs.msg import JointState
from simu_visual.msg import angulo
from simu_visual.msg import posicionxyz

# Crear objetos
joint=JointState()
dtr=pd_tm1_adams.dtr()


####################################################
########### [ Funciones Principales] ###############
####################################################
# |------------------------------------------|
# |------------------  Nodo -----------------|
# |------------------------------------------|
def nodo():
	############### {{{ Inicio Nodo }}} ################## 
	rospy.init_node("posicionador_rviz",anonymous=False)
	############### {{{ Pub and Topics }}} ################## 
	pub=rospy.Publisher("joint_states",JointState,queue_size=10)
	rate=rospy.Rate(7.8125) # Hz
	while not rospy.is_shutdown():
		############### {{{ Escuchar Mensajes Input}}}##################
		rospy.Subscriber("angulos_delta",angulo,callback) # listener RVIZ
		rospy.Subscriber("xyz_delta",posicionxyz,callback_Paderborn) # listener INVERSA

		pub.publish(joint)
		#print(joint.position)
		rate.sleep()

####################################################
################ [ Callback] #######################
####################################################
# |------------------------------------------|
# |----------  callback (RVIZ) --------------|
# |------------------------------------------|
def callback(data):
	global joint
	print("------------------")
	print("input theta 1,2,3")	
	print(data.theta1,data.theta2,data.theta3)
	print("------------------")

	############## {{{ Cinematica Directa }} ###################
	# Dos metodos con distintas ecuacioens y sistemas coordenados globales
	#print("forward")
	#print("theta1"+"/ "+"theta2"+"/ "+"theta3")
	#print(str(data.theta1)+"/ "+str(data.theta2)+"/ "+str(data.theta3))
	pp=delta_kinematics_t1m_adams.forward(data.theta2,data.theta3,data.theta1)
	print("forward XYZ")	
	print(pp)	
	#print("Forward__Paderborn")
	#print("theta1"+"/ "+"theta2"+"/ "+"theta3")
	#print(str(data.theta1)+"/ "+str(data.theta2)+"/ "+str(data.theta3))
	#Paderbrorn: orden en que busca las ecuacoes con phi 0 120 240 es de:  theta 2 , theta 3 y theta1
	#print(data.theta1,data.theta2,data.theta3)
	p=delta_kinematics_Paderborn_tm1_adams.forward_Paderborn(data.theta1,data.theta2,data.theta3)
	print("forward Paderborn XYZ")	
	print(p)

	##################### {{{ Cinematica Inversa }} ######################33
	angles_Paderborn=delta_kinematics_Paderborn_tm1_adams.inverse_Paderborn(p[1],p[2],p[3])
	print("------------------")
	print("inverse Paderborn THETA")	
	print(angles_Paderborn)
	print("inverse THETA123")	
	angles=delta_kinematics_t1m_adams.inverse(pp[1],pp[2],pp[3])
	print(angles)
	print("------------------")
	
	##################### {{{ Cinematica  directa/inversa MALOS  }} ######################33
	p_malo=delta_kinematics_t1m_adams.forward(angles[2],angles[3],angles[1])
	print("p malos xyz")	
	print(p_malo)
	pxyzmalos=delta_kinematics_t1m_adams.inverse(p_malo[1],p_malo[2],p_malo[3])	
	print("p malos thetas")
	print(pxyzmalos)
	print("------------------")


#######################################################################################################
	##################### {{{ Jaxobiano 1 y 2  }} ######################
	[jinv,jxx,theta31,theta32,theta33,theta21,theta22,theta23,Jtotal1] = jacobian_tm1_adams.jacobian_total(pp[1],pp[2],pp[3],data.theta1,data.theta2,data.theta3)
	#print([theta31,theta32,theta33,theta21,theta22,theta23])
	print("-------Normal--------")
	print(pp[1],pp[2],pp[3],data.theta1,data.theta2,data.theta3)                 
	#print(jxx)
	#print("----------------------")
	#print(jinv)
	print(Jtotal1)
	#print(Jtotal1.dot(np.array([[1],[1],[1]])))
	xyznormal=Jtotal1.dot(np.array([[2],[1],[3]]))
	print(np.array([[(-1)*xyznormal[1,0]],[(-1)*xyznormal[0,0]],[(-1)*xyznormal[2,0]]]))
	#print(np.array([[xyznormal[0,0]],[xyznormal[1,0]],[xyznormal[2,0]]]))

	#[jx_Paderborn,jinv_Paderborn,Jtotal2]= jacobian_Paderborn_tm1.jacobian_calculo_Paderborn(p[1],p[2],p[3],data.theta1,data.theta2,data.theta3)
	#print("-------Paderborn--------")
	#print(p[1],p[2],p[3],data.theta1,data.theta2,data.theta3)
	#print(jx_Paderborn)
	#print("----------------------")
	#print(jinv_Paderborn)	
	#print("----------------------")
	#print(Jtotal2)
	#print(Jtotal2.dot(np.array([[1],[1],[1]])))
	#xyzpader=Jtotal2.dot(np.array([[2],[3],[1]]))
	#print(np.array([[xyzpader[1,0]],[xyzpader[0,0]],[xyzpader[2,0]]]))	
	#print(np.array([[(-1)*xyzpader[1,0]],[(1)*xyzpader[0,0]],[(1)*xyzpader[2,0]]]))	
	#print(np.array([[(1)*xyzpader[1,0]],[(-1)*xyzpader[0,0]],[(1)*xyzpader[2,0]]]))	

#######################################################################################################

	############## {{{ Rviz angulos interiores o cuaterniones en Radianes }}} #################
	# cambio rotacion de los tres ejes en 180 para calcular angulos interiores de volutas
	# EJE X se encuentra hacia rotula, theta orden es 2,3,1 en el giro	
	punto=[-p[2]/1000,-p[1]/1000,-p[3]/1000]

	c2=codos_tm1_adams.punto_codo(data.theta2) #1
	p2=codos_tm1_adams.punto_ee(punto,2)#3
	[a2_a,a2_b]=codos_tm1_adams.angulos_codo(c2,p2,2)#4

	c3=codos_tm1_adams.punto_codo(data.theta3) #1
	c3=codos_tm1_adams.rotacion120(c3) #2	
	p3=codos_tm1_adams.punto_ee(punto,3)#3
	[a3_a,a3_b]=codos_tm1_adams.angulos_codo(c3,p3,3)#4

	c1=codos_tm1_adams.punto_codo(data.theta1) #1
	c1=codos_tm1_adams.rotacion120(c1) #2
	c1=codos_tm1_adams.rotacion120(c1) #2
	p1=codos_tm1_adams.punto_ee(punto,1)#3
	[a1_a,a1_b]=codos_tm1_adams.angulos_codo(c1,p1,1)#4

	# Datos para publicar en Rviz
	joint.header=std_msgs.msg.Header()
	joint.header.stamp=rospy.Time.now()
	
	# Ubicacion motores segun kinematica Paderborn  theta 2 , theta 3 y theta1
	# Sistema coordenado global kinematica Paderborn 
	joint.name=["base_brazo1","base_brazo2","base_brazo3","codo1_a","codo1_b","codo2_a","codo2_b","codo3_a","codo3_b","act_x","act_y","act_z"]
	joint.position=[data.theta1*dtr,data.theta2*dtr,data.theta3*dtr,data.theta1*dtr+a1_a,a1_b,data.theta2*dtr+a2_a,a2_b,data.theta3*dtr+a3_a,a3_b,p[1]/1000,p[2]/1000,p[3]/1000]
	#joint.position=[angles[1]*dtr,angles[2]*dtr,angles[3]*dtr,angles[1]*dtr+a1_a,a1_b,angles[2]*dtr+a2_a,a2_b,angles[3]*dtr+a3_a,a3_b,p[1]/1000,p[2]/1000,p[3]/1000]

	joint.velocity=[]
	joint.effort=[]
	print(joint)
	############## {{{ Cinematica Inversa (XYZ -> THETAI) }}} ###################
     	#print("Inverse")
	#print(-p[1],p[2],p[3])
	#angles=delta_kinematics.inverse(-p[1],p[2],p[3])
	# Salida angulos orden xxxxxxxxxxxxxxxxxxxxx
	#print(angles)

	#print("Inverse_Paderborn")
        #print(p[1],p[2],p[3])
	#angles_Paderborn=delta_kinematics_Paderbor1.inverse_Paderborn(p[1],p[2],p[3])
	# Salida angulos orden theta2, theta3 y theta1
	#print(angles_Paderborn)

# |------------------------------------------|
# |----------  callback_Paderborn -----------|
# |------------------------------------------|
# (Kinematica inversa 2 algoritmos)
def callback_Paderborn(data):
	# rospy.loginfo("callback")
	angles_Paderborn=delta_kinematics_Paderborn_adams.inverse_Paderborn(data.x0,data.y0,data.z0)
	angles=delta_kinematics_adams.inverse(data.x0,data.y0,data.z0)
	print(angles_Paderborn)
	print(angles)

####################################################
########### [ Main Funtion] ########################
####################################################
# |------------------------------------------|
# |--------------- Crear Nodo ---------------|
# |------------------------------------------|
if __name__=="__main__":
	try:
		nodo()
	except rospy.ROSInterruptException:
		pass


################### FIN #################################

