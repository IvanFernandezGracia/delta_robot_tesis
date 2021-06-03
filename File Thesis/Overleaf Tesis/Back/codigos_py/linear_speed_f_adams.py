# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Linear segment with parabolic blend (LSPB)
# Objetivo: Perfil trapezoidal de velocidad

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import pd_tm1_adams
import numpy as np
from numpy.linalg import inv
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

###############################################
########### [Parametros] ######################
###############################################
mtmm = pd_tm1_adams.mtmm()
mmtm = pd_tm1_adams.mmtm()


###############################################
##### [ Linear Speed  LSPB (Total)] ###########
###############################################
# q0 y q1 en [metros]
# vmax [metros/segundos]
# amax [metros / segundos^2]
# pas 1 y pas 2 son numero enteros
def ls_v_a_total(q0, q1, vmax, amax, pas_1, pas_2):
 ####### {{{ Cambio unidades SI }}} ##################
 q0 *= mmtm
 q1 *= mmtm
 vmax *= mmtm
 amax *= mmtm

 if (pas_1 <= 0):
  pas_1 = 2
 if (pas_2 <= 0):
  pas_2 = 2

 ####### {{{ Parametros Curva }}} ##################
 tau = vmax / amax
 s = np.sign((q1 - q0))
 T = (s * (((q1) - (q0)) / (vmax))) + (tau)
 paso1 = (tau) / pas_1
 paso2 = (T - (2 * tau)) / pas_2
 pas_total = pas_1 + pas_2 + pas_1 + 1

 Tf = 2 * (math.sqrt(((q1) - (q0)) / (amax)))
 vmax_acel = amax * (Tf / 2)
 if (vmax_acel <= vmax):
  ##### {{{ Parametros Curva Amax triangular }}} #####
  vmax = vmax_acel
  tau = Tf / 2
  T = Tf
  paso1 = (tau) / pas_1
  paso2 = 0
  pas_2 = 0
  pas_total = pas_1 + pas_2 + pas_1 + 1

 ####### {{{ Creacion Matrices }}} ##################
 pos = np.zeros((1, pas_total))
 vel = np.zeros((1, pas_total))
 acel = np.zeros((1, pas_total))
 tiempo = np.zeros((1, pas_total))

 ti = -1 * paso1
 for i in range(0, pas_1 + 1):
  ti = ti + paso1
  x = ls_v_a_puntual(q0, q1, vmax, amax, ti)
  pos[0, i] = x[0]
  vel[0, i] = x[1]
  acel[0, i] = x[2]
  tiempo[0, i] = ti
 for i in range(pas_1 + 1, pas_1 + pas_2 + 1):
  ti = ti + paso2
  x = ls_v_a_puntual(q0, q1, vmax, amax, ti)
  pos[0, i] = x[0]
  vel[0, i] = x[1]
  acel[0, i] = x[2]
  tiempo[0, i] = ti
 for i in range(pas_1 + pas_2 + 1, pas_1 + pas_2 + pas_1):
  ti = ti + paso1
  x = ls_v_a_puntual(q0, q1, vmax, amax, ti)
  pos[0, i] = x[0]
  vel[0, i] = x[1]
  acel[0, i] = x[2]
  tiempo[0, i] = ti
 for i in range(pas_1 + pas_2 + pas_1, pas_1 + pas_2 + pas_1 + 1):
  ti = T
  x = ls_v_a_puntual(q0, q1, vmax, amax, ti)
  pos[0, i] = x[0]
  vel[0, i] = x[1]
  acel[0, i] = x[2]
  tiempo[0, i] = ti

 ####### {{{ Plot }}} ##################
 ax = plt.subplot(121)

 plt.subplot(1, 3, 1)
 plt.plot(tiempo[0, :], mtmm * pos[0, :], 'o-')
 plt.title('Posicion vs time')
 plt.xlabel('time [t]')
 plt.ylabel('[mm]')
 plt.grid(True)

 plt.subplot(1, 3, 2)
 plt.plot(tiempo[0, :], mtmm * vel[0, :], '.-')
 plt.title('vel vs time')
 plt.xlabel('time [t]')
 plt.ylabel('[mm/s]')
 plt.grid(True)

 plt.subplot(1, 3, 3)
 plt.plot(tiempo[0, :], mtmm * acel[0, :], '.-')
 plt.title('acel vs time')
 plt.xlabel('time [t]')
 plt.ylabel('[mm/s2]')
 plt.grid(True)

 plt.ion()
 plt.show()
 plt.pause(0.3)
 plt.ioff()
 plt.close("all")  # 00x0
 return [tiempo, mtmm * pos, mtmm * vel, mtmm * acel]


###############################################
####### [ Linear Speed (PUNTUAL)] #############
###############################################
# q0 y q1 en [metros]
# vmax [metros/segundos]
# amax [metros / segundos^2]
# tactual [segundos]
def ls_v_a_puntual(q0, q1, vmax, amax, tactual):
 tau = vmax / amax
 s = np.sign((q1 - q0))
 T = (s * (((q1) - (q0)) / (vmax))) + (tau)
 tramo1 = tau
 tramo2 = T - tau
 tramo3 = T
 if ((0 <= tactual) and (tactual <= tramo1)):
  q_actual = (q0) + ((s) * (amax / 2) * (tactual ** 2))
  v_actual = s * amax * tactual
  a_actual = s * amax
  res = [q_actual, v_actual, a_actual, tramo1, tramo2, tramo3]
  return res
 elif ((tramo1 < tactual) and (tactual <= tramo2)):
  q_actual = (q0) - ((s) * ((vmax ** 2) / (2 * amax))) + (s * vmax * tactual)
  v_actual = s * vmax
  a_actual = 0
  res = [q_actual, v_actual, a_actual, tramo1, tramo2, tramo3]
  return res
 elif ((tramo2 < tactual) and (tactual <= tramo3)):
  q_actual = (q1) + \
			 ((s) * ((-1 * ((amax * (T ** 2)) / (2)))
					 + (amax * T * tactual)
					 + (-1 * (amax / 2) * (tactual ** 2))))
  v_actual = s * ((amax * T) - (amax * tactual))
  a_actual = s * (-1 * amax)
  res = [q_actual, v_actual, a_actual, tramo1, tramo2, tramo3]
  return res
 else:
  res = [0, 0, 0, tramo1, tramo2, tramo3]
  return res

################### FIN #######################
