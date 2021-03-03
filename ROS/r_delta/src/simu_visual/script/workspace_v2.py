#!/usr/bin/env python
# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Crear espacio de trabajo del robot delta a partir de restricciones

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import pd_tm1_adams
import delta_kinematics_t1m_adams
import jacobian_tm1_adams
import rospy
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import plot_delta
################################################
######## [Importar mensajes] ###################
################################################
from simu_visual.msg import parameter_ws

###############################################
########### [Parametros] ######################
###############################################
e = pd_tm1_adams.e()
f = pd_tm1_adams.f()
re = pd_tm1_adams.l2()
rf = pd_tm1_adams.l1()

pi = pd_tm1_adams.pi()
dtr = pd_tm1_adams.dtr()


##############################################
####### [ Funcion PrincipaL] #################
##############################################
# |------------------------------------------|
# |----------------- NODO -------------------| 
# |------------------------------------------|
def nodo():
 global resultados
 global permiso
 global step_global
 global id_call

 ####### {{{ Inicio Nodo }}} #######
 rospy.init_node("workspace_delta", anonymous=False)
 rate = rospy.Rate(7)  # Hz

 ####### {{{ Varibales para comprobar mensaje entrante }}} #######
 permiso = False
 step_global = 0
 id_call = 0
 id_permiso = 0
 while not rospy.is_shutdown():
  rate.sleep()

  ####### {{{ Topics }}} #######
  rospy.Subscriber("input_workspace", parameter_ws, callback)  # listener

  if (permiso == True) and (step_global != 0) and (id_call != id_permiso):
   rospy.loginfo("Creando Trayectoria!")
   # Array de puntos XYZ del espacio de trabajo
   resultados = espaciotrabajo(step_global)
   rospy.loginfo("Workspace Creado, numero puntos:" +
				 str(resultados[1]) + "  ID: " + str(id_call))
   rospy.loginfo("Workspace Creado, numero puntos JXX:" +
				 str(resultados[3]) + "  ID: " + str(id_call))
   rospy.loginfo("Workspace Creado, numero puntos JINV:" +
				 str(resultados[5]) + "  ID: " + str(id_call))

   # Graficar puntos anteriores
   plot_delta.graphws(resultados[0], resultados[2], resultados[4], resultados[6])
   rospy.loginfo("Grafico Workspace Listo!")

   ####### {{{ Reset variable comprobar mensaje entrante}}} #######
   permiso = False
   step_global = 0
   id_permiso = id_call


# |------------------------------------------|
# |-------- Calcular Workspace --------------|
# |------------------------------------------|
def espaciotrabajo(deltaangulo):
 ####### {{{ Direccion txt para guardar ws }}} ######
 mi_path = "/home/ivan/r_delta/src/simu_visual/script/workspace.txt"

 ######## {{{ Crear matrices ws }}} ######
 size_rows = int(((180.0 / deltaangulo) + 1) ** 3)
 espTra = np.zeros([size_rows, 6], dtype=float)
 espTra_singu = np.zeros([size_rows, 6], dtype=float)
 espTra_singu_inv = np.zeros([size_rows, 6], dtype=float)
 espTra_real = np.zeros([size_rows, 6], dtype=float)

 ######## {{{ Restricciones limines de angulos 1i }}} ######
 res_ang_min = pd_tm1_adams.res_ang_min()
 res_ang_max = pd_tm1_adams.res_ang_max()

 cont = 0
 cont_singu = 0
 cont_singu_inv = 0
 for theta11 in range(res_ang_min, res_ang_max, deltaangulo):
  for theta12 in range(res_ang_min, res_ang_max, deltaangulo):
   for theta13 in range(res_ang_min, res_ang_max, deltaangulo):
	####### {{{ Cinematica Directa }}} ######
	Pnew = delta_kinematics_t1m_adams.forward(theta12, theta13, theta11)

	# Punto a Guardar proximamente
	px = Pnew[1]  # [mm]
	py = Pnew[2]  # [mm]
	pz = Pnew[3]  # [mm]

	####### {{{ Jacobiano Metodo A}}} #######
	[jinv, jxx,
	 theta31, theta32, theta33,
	 theta21, theta22, theta23,
	 Jtotal1] = jacobian_tm1_adams.jacobian_total(px, py, pz,
	 theta11, theta12, theta13)

	# Determinantes para Singularidades
	det_jinv = np.linalg.det(jinv)
	det_jxx = np.linalg.det(jxx)

	####### {{{ Restricciones angulos y Singularidades }}} #######
	theta2i_min = pd_tm1_adams.theta2i_min()
	theta2i_max = pd_tm1_adams.theta2i_max()
	theta3i_min = pd_tm1_adams.theta3i_min()
	theta3i_max = pd_tm1_adams.theta3i_max()

	####### {{{ Restricciones de angulo 2i y 3i para cada brazo }}} #######
	if (theta2i_min < theta21 < theta2i_max and
	  theta2i_min < theta22 < theta2i_max and
	  theta2i_min < theta23 < theta2i_max):
	 if (theta3i_min < theta31 < theta3i_max and
	   theta3i_min < theta32 < theta3i_max and
	   theta3i_min < theta33 < theta3i_max):

	  ####### {{{ Restricciones Singularidad Jacobiano }}} #######
	  # Error singularidad
	  err_jxx = pd_tm1_adams.err_jxx()
	  err_jinv = pd_tm1_adams.err_jinv()

	  # *************************************
	  # ******* {{{ Jx=0 y Jinv=O }}} *******
	  # *************************************
	  if (det_jxx > err_jxx or det_jxx < (-1 * err_jxx)) and (
		det_jinv > err_jinv or det_jinv < (-1 * err_jinv)):

	   espTra[cont, 0] = px
	   espTra[cont, 1] = py
	   espTra[cont, 2] = pz
	   espTra[cont, 3] = theta11
	   espTra[cont, 4] = theta12
	   espTra[cont, 5] = theta13
	   cont = cont + 1

	   # *************************************
	   # ****** {{{ Restriccion Cubo}}} ******
	   # *************************************
	   if (((px < pd_tm1_adams.px_max_ws()) and
			(px > pd_tm1_adams.px_min_ws()))
		 and ((py < pd_tm1_adams.py_max_ws()) and
			  (py > pd_tm1_adams.py_min_ws()))
		 and ((pz < pd_tm1_adams.pz_max_ws()) and
			  (pz > pd_tm1_adams.pz_min_ws()))):
		espTra_real[cont, 0] = px
		espTra_real[cont, 1] = py
		espTra_real[cont, 2] = pz
		espTra_real[cont, 3] = theta11
		espTra_real[cont, 4] = theta12
		espTra_real[cont, 5] = theta13

	  # *************************************
	  # ******* {{{ espTra_singu }}} ********
	  # *************************************
	  # Jx=0
	  if (not (det_jxx > err_jxx or
			   det_jxx < (-1 * err_jxx))):
	   espTra_singu[cont_singu, 0] = px
	   espTra_singu[cont_singu, 1] = py
	   espTra_singu[cont_singu, 2] = pz
	   espTra_singu[cont_singu, 3] = theta11
	   espTra_singu[cont_singu, 4] = theta12
	   espTra_singu[cont_singu, 5] = theta13
	   cont_singu = cont_singu + 1

	  # *************************************
	  # ******* {{{ espTra_singu_inv }}} ****
	  # *************************************
	  # Jinv=0
	  if (not (det_jinv > err_jinv or
			   det_jinv < (-1 * err_jinv))):
	   espTra_singu_inv[cont_singu_inv, 0] = px
	   espTra_singu_inv[cont_singu_inv, 1] = py
	   espTra_singu_inv[cont_singu_inv, 2] = pz
	   espTra_singu_inv[cont_singu_inv, 3] = theta11
	   espTra_singu_inv[cont_singu_inv, 4] = theta12
	   espTra_singu_inv[cont_singu_inv, 5] = theta13
	   cont_singu_inv = cont_singu_inv + 1

 ##### {{{ Guardar WS }}} ####
 # Guardar WS txt
 f = open(mi_path, 'w')
 for i in range(0, cont, 1):
  f.write('\t'.join(str(v) for v in espTra[i, 0:6]) + "\n")
 f.close()
 return [espTra, cont - 1,
		 espTra_singu, cont_singu - 1,
		 espTra_singu_inv, cont_singu_inv - 1,
		 espTra_real, cont - 1]


####################################################
################ [ Callback] #######################
####################################################
def callback(data):
 global permiso
 global step_global
 global id_call

 permiso = data.graficar_realtime
 step_global = data.step
 id_call = data.idcall


##############################################
########### [ Main Funtion] ##################
##############################################
if __name__ == "__main__":
 try:
  nodo()
 except rospy.ROSInterruptException:
  pass

############### FIN #################
