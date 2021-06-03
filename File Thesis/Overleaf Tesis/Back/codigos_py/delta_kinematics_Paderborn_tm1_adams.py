# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Cinematica Directa y Inversa robot delta

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import numpy as np
from numpy.linalg import inv
import matplotlib.pyplot as plt
import pd_tm1_adams

###############################################
########### [Parametros] ######################
###############################################
e = pd_tm1_adams.e()
f = pd_tm1_adams.f()
re = pd_tm1_adams.l2()
rf = pd_tm1_adams.l1()

# Constantes Trigonometricas
sqrt3 = pd_tm1_adams.sqrt3()
pi = pd_tm1_adams.pi()
sin120 = sqrt3 / 2.0
cos120 = pd_tm1_adams.cos120()
tan60 = sqrt3
sin30 = pd_tm1_adams.sin30()
tan30 = pd_tm1_adams.tan30()
cos30 = pd_tm1_adams.cos30()

dtr = pd_tm1_adams.dtr()
mtmm = pd_tm1_adams.mtmm()
mmtm = pd_tm1_adams.mmtm()


###############################################
####### [ Cinematica Directa ] ################
###############################################

# ******************************************
# ****** {{{ Directa }}} *******************
# ******************************************
def forward_Paderborn(theta1, theta2, theta3):
 theta2 *= dtr
 theta1 *= dtr
 theta3 *= dtr

 x0 = 0.0
 y0 = 0.0
 z0 = 0.0

 t = (f - e) * tan30 / 2.0

 # j2prima_x=0
 j2prima_y = -(t) - (rf * math.cos(theta2))
 j2prima_z = -rf * (math.sin(theta2))

 j3prima_y = (t + (rf * math.cos(theta3))) * sin30
 j3prima_x = (t + (rf * math.cos(theta3))) * cos30
 j3prima_z = -rf * (math.sin(theta3))

 j1prima_y = (t + (rf * math.cos(theta1))) * sin30
 j1prima_x = (-1) * (t + (rf * math.cos(theta1))) * cos30
 j1prima_z = -rf * (math.sin(theta1))

 # x1=j2prima_x
 y1 = j2prima_y
 z1 = j2prima_z

 y2 = j3prima_y
 x2 = j3prima_x
 z2 = j3prima_z

 y3 = j1prima_y
 x3 = j1prima_x
 z3 = j1prima_z

 dnm = (y2 - y1) * x3 - (y3 - y1) * x2

 w1 = y1 * y1 + z1 * z1
 w2 = x2 * x2 + y2 * y2 + z2 * z2
 w3 = x3 * x3 + y3 * y3 + z3 * z3

 # x = ( a1 * z + b1 ) / dnm
 a1 = (z2 - z1) * (y3 - y1) - (z3 - z1) * (y2 - y1)
 b1 = -((w2 - w1) * (y3 - y1) - (w3 - w1) * (y2 - y1)) / 2.0

 # y = ( a2 * z + b2 ) / dnm
 a2 = -(z2 - z1) * x3 + (z3 - z1) * x2
 b2 = ((w2 - w1) * x3 - (w3 - w1) * x2) / 2.0

 # a * z ^2 + b * z + c = 0
 a = a1 * a1 + a2 * a2 + dnm * dnm
 b = 2.0 * (a1 * b1 + a2 * (b2 - y1 * dnm) - z1 * dnm * dnm)
 c = (b2 - y1 * dnm) * (b2 - y1 * dnm) + b1 * b1 + dnm * dnm * (z1 * z1 - re * re)

 # discriminante
 d = b * b - 4.0 * a * c
 if d < 0.0:
  print("discriminante - directa Paderborn")
  return [1, 0, 0, 0]  # error

 z0 = -0.5 * (b + math.sqrt(d)) / a
 x0 = (a1 * z0 + b1) / dnm
 y0 = (a2 * z0 + b2) / dnm

 y0 *= mtmm
 x0 *= mtmm
 z0 *= mtmm
 return [0, x0, y0, z0]


###############################################
####### [ Cinematica Inversa ] ################
###############################################
# ******************************************
# ****** {{{ Inversa }}} *******************
# ******************************************
def inverse_Paderborn(p0x, p0y, p0z):
 p0x *= mmtm
 p0y *= mmtm
 p0z *= mmtm

 theta1 = 0
 theta2 = 0
 theta3 = 0
 status = angle_yz_Paderborn(p0x, p0y, p0z)

 if status[0] == 0:
  theta2 = status[1]
  status = angle_yz_Paderborn(p0x * cos120 + p0y * sin120,
   p0y * cos120 - p0x * sin120,
   p0z,
   theta3)

 if status[0] == 0:
  theta3 = status[1]
  status = angle_yz_Paderborn(p0x * cos120 - p0y * sin120,
   p0y * cos120 + p0x * sin120,
   p0z,
   theta1)

 theta1 = status[1]

 return [status[0], theta1, theta2, theta3]


# ******************************************
# ****** {{{ Plano YZ }}} ******************
# ******************************************
def angle_yz_Paderborn(p0x, p0y, p0z, theta=None):
 f2y = -1 * (f / (2 * math.sqrt(3)))

 # Centros y Radios de los 2 circulos
 h1 = (p0y) - ((e) / (2 * math.sqrt(3)))
 k1 = p0z
 h2 = f2y
 k2 = 0
 R1 = math.sqrt(((re) ** 2) - ((p0x) ** 2))
 R2 = (rf)
 dist_centros = math.sqrt(((h1 - h2) ** 2) + ((k1 - k2) ** 2))

 # Casos de interseccion
 if dist_centros > R1 + R2:
  print("non intersecting KI")
  return [1, 0]
 elif dist_centros < abs(R1 - R2):
  print("One circle within other KI")
  return [1, 0]
 elif dist_centros == 0 and R1 == R2:
  print("coincident circles KI")
  return [1, 0]
 else:
  a = (R1 ** 2 - R2 ** 2 + dist_centros ** 2) / (2 * dist_centros)
  h = math.sqrt(R1 ** 2 - a ** 2)

  x2 = h1 + a * (h2 - h1) / dist_centros
  y2 = k1 + a * (k2 - k1) / dist_centros

  x3 = x2 + h * (k2 - k1) / dist_centros
  y3 = y2 - h * (h2 - h1) / dist_centros

  x4 = x2 - h * (k2 - k1) / dist_centros
  y4 = y2 + h * (h2 - h1) / dist_centros
 # Intersection (x3, y3) (x4, y4)

 if x3 < x4:
  j2y = x3
  j2z = y3
 else:
  j2y = x4
  j2z = y4

 if (f2y - j2y) != 0:
  theta = math.atan(((-1) * (j2z)) / (abs(f2y - j2y)))
  if (j2y < f2y):
   theta = theta * (180.0 / pi)
  else:
   if j2z < 0:
	theta = theta * (180.0 / pi)
	theta = 180 - theta
   else:
	theta = theta * (180.0 / pi)
	theta = (-1 * 180) + theta
 else:
  if j2z < 0:
   theta = 90
  else:
   theta = -90
 return [0, theta]  # error


# ******************************************
# ****** {{{ Inversa Matricial }}} *********
# ******************************************
def inverse_Paderborn_m(p0x_m, p0y_m, p0z_m):
 tamano = len(p0x_m)
 theta1_m = np.zeros((1, tamano))
 theta2_m = np.zeros((1, tamano))
 theta3_m = np.zeros((1, tamano))
 for i in range(0, tamano):
  theta_m = inverse_Paderborn(p0x_m[i], p0y_m[i], p0z_m[i])
  theta1_m[0, i] = theta_m[1]
  theta2_m[0, i] = theta_m[2]
  theta3_m[0, i] = theta_m[3]
 return [theta1_m[0], theta2_m[0], theta3_m[0]]
