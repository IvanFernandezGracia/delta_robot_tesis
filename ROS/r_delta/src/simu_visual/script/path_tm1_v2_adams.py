#!/usr/bin/env python
# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Comparar los torques calculados por
# los algoritmos del metodo A, metodo B y en ADAMS.

###############################################
####### [Importar Librerias] ##################
###############################################
import numpy as np
import random
import plot_delta
import rospy
import trans_rot_ls_adams
import linear_speed_f_adams
import delta_kinematics_t1m_adams
import delta_kinematics_Paderborn_tm1_adams
import jacobian_tm1_adams
import jacobian_Paderborn_tm1_v2_adams
import torque_m1_adams
import torque_m1_Paderborn_v2_adams

################################################
######## [Importar mensajes] ###################
################################################
from simu_visual.msg import matriz_path_ls
from simu_visual.msg import linear_speed_xyz


#################################################
#######  [ Nodo ] ###############################
#################################################
def nodo():
 ####### {{{ callback_linear_speed_xyz(data) }}} #######
 global permiso_2
 global id_call_2
 global call_xo_2
 global call_yo_2
 global call_zo_2
 global call_xf_2
 global call_yf_2
 global call_zf_2
 global call_vmax_2
 global call_amax_2
 global call_pas1_2
 global call_pas2_2
 global num_tray_2

 ####### {{{ Variables verifica mensaje entrante }}} #######
 permiso_2 = False
 id_call_2 = 0
 id_permiso_2 = 0

 ####### {{{ Iniciar Nodo ROS }}} ##################
 rospy.init_node("torque_metodo_1", anonymous=False)
 rate = rospy.Rate(7.8125)  # Hz

 ####### {{{ Publisher }}} ##################
 pub1 = rospy.Publisher("m_txyzth123", matriz_path_ls, queue_size=10)

 while not rospy.is_shutdown():
  #######  {{{ Topics }}} ##################
  rospy.Subscriber("input_ls_final", linear_speed_xyz, callback_linear_speed_xyz)

  if (permiso_2 == True and id_call_2 != id_permiso_2 and (
	call_xo_2 != call_xf_2 or call_yo_2 != call_yf_2 or call_zo_2 != call_zf_2) and (
	call_vmax_2 > 0 and call_amax_2 > 0)):
   rospy.loginfo("Creando Torque M1 Trayectoria i=1,2,3!")

   # ******************************************
   # ****** {{{ Crear Trayectoria }}} *********
   # ******************************************

   #######  {{{ Rotacion punto final e inicial }}} #######
   resultados_2 = trans_rot_ls_adams.path_linear_speed(call_xo_2, call_yo_2, call_zo_2,
	call_xf_2, call_yf_2, call_zf_2)
   #######  {{{ Perfil trapezoidal de velocidad }}} #######
   resultados_3 = linear_speed_f_adams.ls_v_a_total(0, resultados_2[0],
	call_vmax_2, call_amax_2,
	call_pas1_2, call_pas2_2)
   ########  {{{ Rotacion inversa punto final, inicial y trayectoria}}} #######
   resultados_4 = trans_rot_ls_adams.path_linear_speed_inv(resultados_3[0],
	resultados_3[1], resultados_3[2], resultados_3[3],
	resultados_2[1], resultados_2[2],
	resultados_2[3], resultados_2[4],
	resultados_2[5])
   #######  {{{ Guardar en Matriz Trayectoria espacio cartesiano XYZ }}} #######
   res_1 = [resultados_4[0],
			resultados_4[1], resultados_4[4], resultados_4[7],
			resultados_4[2], resultados_4[5], resultados_4[8],
			resultados_4[3], resultados_4[6], resultados_4[9]]

   # ******************************************
   # ****** {{{ Metodo A}}} *******************
   # ******************************************

   #######  {{{ Cinematica Inversa }}} #######
   res_2 = delta_kinematics_t1m_adams.inverse_m(res_1[1], res_1[4], res_1[7])
   ####### {{{ Visualizacion Trayectoria Rviz}}} #######
   enviar = matriz_path_ls()
   enviar.x = res_1[1]
   enviar.y = res_1[4]
   enviar.z = res_1[7]
   enviar.th1 = res_2[0]
   enviar.th2 = res_2[1]
   enviar.th3 = res_2[2]
   enviar.tiempo = res_1[0] * 10.0
   enviar.permiso = bool(1)
   enviar.id_call = random.randrange(10)
   pub1.publish(enviar)
   n_1 = len(res_1[1])
   ####### {{{ Guardar Trayectoria }}} #######
   path_root = "/home/ivan/r_delta/src/simu_visual/script/"
   path_root_tray = "resultado_trayectorias/Tray_"
   mi_path1 = path_root + path_root_tray + str(num_tray_2) + "_XYZ.txt"
   mi_path2 = path_root + path_root_tray + str(num_tray_2) + "_Theta.txt"
   mi_path3 = path_root + path_root_tray + str(num_tray_2) + "_Tiempo.txt"
   fic1 = open(mi_path1, "w")
   data1 = np.append(np.append(res_1[1], res_1[4]), res_1[7])
   for line in data1:
	fic1.write(str(line * (0.001)))
	fic1.write("\n")
   fic1.close()
   fic2 = open(mi_path2, "w")
   data2 = np.append(np.append(res_2[0], res_2[1]), res_2[2])
   for line in data2:
	fic2.write(str(line * ((np.pi) / 180)))
	fic2.write("\n")
   fic2.close()
   fic3 = open(mi_path3, "w")
   for line in res_1[0]:
	fic3.write(str(line))
	fic3.write("\n")
   fic3.close()
   ####### {{{ Velocidad y Aceleracion Angular }}} #######
   res_3 = jacobian_tm1_adams.jacobian_total_macel(res_1[1], res_1[4], res_1[7],
	res_1[2], res_1[5], res_1[8],
	res_1[3], res_1[6], res_1[9],
	res_2[0], res_2[1], res_2[2])
   ####### {{{ Fuerza Externa en el Efector }}} #######
   res_4 = [(res_1[1]) * 0, (res_1[1]) * 0, (res_1[1]) * 0]
   ####### {{{ Torques }}} #######
   res_5 = torque_m1_adams.ti_matriz(res_3[3], res_3[4], res_3[5],
	res_2[0], res_2[1], res_2[2],
	res_1[1], res_1[4], res_1[7],
	res_1[3], res_1[6], res_1[9],
	res_4[0], res_4[1], res_4[2],
	0.0)
   ####### {{{ Guardar Torque Metodo A }}} #######
   path_root_t = "resultados_torque_metodo_a/Tray_"
   mi_path11 = path_root + path_root_t + str(num_tray_2) + "_Torque1.txt"
   mi_path22 = path_root + path_root_t + str(num_tray_2) + "_Torque2.txt"
   mi_path33 = path_root + path_root_t + str(num_tray_2) + "_Torque3.txt"
   fic11 = open(mi_path11, "w")
   for line in res_5[0]:
	fic11.write(str(line))
	fic11.write("\n")
   fic11.close()
   fic22 = open(mi_path22, "w")
   for line in res_5[1]:
	fic22.write(str(line))
	fic22.write("\n")
   fic22.close()
   fic33 = open(mi_path33, "w")
   for line in res_5[2]:
	fic33.write(str(line))
	fic33.write("\n")
   fic33.close()

   # ******************************************
   # ******* {{{ Metodo B}}} ******************
   # ******************************************

   #######  {{{ Cinematica Inversa }}} #######
   res_6 = delta_kinematics_Paderborn_tm1_adams. \
	inverse_Paderborn_m(res_1[1], res_1[4], res_1[7])
   ####### {{{ Visualizacion Trayectoria Rviz}}} #######
   enviar = matriz_path_ls()
   enviar.x = res_1[1]
   enviar.y = res_1[4]
   enviar.z = res_1[7]
   enviar.th1 = res_6[0]
   enviar.th2 = res_6[1]
   enviar.th3 = res_6[2]
   enviar.tiempo = res_1[0] * 1.0
   enviar.permiso = bool(1)
   enviar.id_call = random.randrange(10)
   pub1.publish(enviar)
   ####### {{{ Velocidad y Aceleracion Angular }}} #######
   res_10 = jacobian_Paderborn_tm1_v2_adams.\
	jacobian_total_macel(res_1[1], res_1[4], res_1[7],
	res_1[2], res_1[5], res_1[8],
	res_6[0], res_6[1], res_6[2],
	res_1[3], res_1[6], res_1[9])
   ####### {{{ Fuerza Externa en el Efector }}} #######
   res_8 = [(res_1[1]) * 0, (res_1[1]) * 0, (res_1[1]) * 0]
   ####### {{{ Torques }}} #######
   res_11 = torque_m1_Paderborn_v2_adams.ti_matriz(res_10[5], res_10[6], res_10[7],
	res_6[0], res_6[1], res_6[2],
	res_1[1], res_1[4], res_1[7],
	res_8[0], res_8[1], res_8[2],
	res_10[3], 0.0, res_10[4],
	res_10[0], res_10[1], res_10[2])

   # ********************************************************************
   # *** {{{ Compara Torques Metodo A ,Metodo B y ADAMS}}} **************
   # ******************************************#*************************

   ####### {{{ Leer Torque ADAMS }}} #######
   path_root_t_adams="resultados_torque_adams/adams_"
   mi_path44 = path_root + path_root_t_adams + str(num_tray_2) + ".txt"
   data_numpi = np.loadtxt(mi_path44, delimiter='\t')
   ####### {{{ Plotear posicion, velocidad y aceleracion angular }}} #######
   plot_delta.comparar_angles(
	[res_1[0],
	 res_2[0], res_3[0], res_3[3],
	 res_2[1], res_3[1], res_3[4],
	 res_2[2], res_3[2], res_3[5],
	 res_6[0], res_10[0], res_10[5],
	 res_6[1], res_10[1], res_10[6],
	 res_6[2], res_10[2], res_10[7]])
   ####### {{{ Plotear Torques }}} #######
   plot_delta.torque_adams(res_1[0],
	res_5[0], res_5[1], res_5[2],
	res_11[0], res_11[1], res_11[2],
	data_numpi[:, 1] * (-0.001), data_numpi[:, 2] * (-0.001),
	data_numpi[:, 3] * (-0.001),
	data_numpi[:, 0])

   # ********************************************
   # **** {{{ Reset mensaje entrante}}} *********
   # ********************************************
   permiso_2 = False
   id_permiso_2 = id_call_2

  rate.sleep()
 return


####################################################
########### [ Callback ] ###########################
####################################################
def callback_linear_speed_xyz(data):
 global permiso_2
 global id_call_2
 global call_xo_2
 global call_yo_2
 global call_zo_2
 global call_xf_2
 global call_yf_2
 global call_zf_2
 global call_vmax_2
 global call_amax_2
 global call_pas1_2
 global call_pas2_2
 global num_tray_2

 call_xo_2 = data.xo
 call_yo_2 = data.yo
 call_zo_2 = data.zo
 call_xf_2 = data.xf
 call_yf_2 = data.yf
 call_zf_2 = data.zf
 call_vmax_2 = data.vmax
 call_amax_2 = data.amax
 call_pas1_2 = data.paso1
 call_pas2_2 = data.paso2
 permiso_2 = data.ls_fin
 id_call_2 = data.idcall
 num_tray_2 = data.num_tray


####################################################
########### [ Main Funtion] ########################
####################################################
if __name__ == "__main__":
 try:
  nodo()
 except rospy.ROSInterruptException:
  pass

################### FIN #############################
