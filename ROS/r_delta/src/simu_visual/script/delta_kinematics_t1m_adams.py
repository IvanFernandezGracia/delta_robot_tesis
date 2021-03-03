#Nombre Creador: Ivan Alejandro Fernandez Gracia
#Universidad: Universidad de Santiago de Chile
#Mail: ivan.fernandez.g@usach.cl
#Objetivo: Cinematica directa e inversa robot delta

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
e=pd_tm1_adams.e()
f=pd_tm1_adams.f()
re=pd_tm1_adams.l2()
rf=pd_tm1_adams.l1()

# Constantes Trigonometricas
sqrt3=pd_tm1_adams.sqrt3()
pi=pd_tm1_adams.pi()
sin120=sqrt3/2.0
cos120=pd_tm1_adams.cos120()
tan60=sqrt3
sin30=pd_tm1_adams.sin30()
tan30=pd_tm1_adams.tan30()

# Transformacion unidades
dtr=pd_tm1_adams.dtr()
mtmm=pd_tm1_adams.mtmm()
mmtm=pd_tm1_adams.mmtm()
rtd= pd_tm1_adams.rtd()

###############################################
####### [ Cinematica Directa ] ################
###############################################

# ******************************************
# ****** {{{ Directa }}} *******************
# ******************************************
def forward(theta1,theta2,theta3):
   theta1*=dtr
   theta2*=dtr
   theta3*=dtr

   x0=0.0
   y0=0.0
   z0=0.0

   t=(f-e)*tan30/2.0

   y1=-(t+rf*math.cos(theta1))
   z1=-rf*math.sin(theta1)

   y2=(t+rf*math.cos(theta2))*sin30
   x2=y2*tan60
   z2=-rf*math.sin(theta2)

   y3=(t+rf*math.cos(theta3))*sin30
   x3=-y3*tan60
   z3=-rf*math.sin(theta3)

   dnm=(y2-y1)*x3-(y3-y1)*x2
             
   w1=y1*y1+z1*z1
   w2=x2*x2+y2*y2+z2*z2
   w3=x3*x3+y3*y3+z3*z3

   # x = ( a1 * z + b1 ) / dnm
   a1=(z2-z1)*(y3-y1)-(z3-z1)*(y2-y1)
   b1=-((w2-w1)*(y3-y1)-(w3-w1)*(y2-y1))/2.0

   # y = ( a2 * z + b2 ) / dnm
   a2=-(z2-z1)*x3+(z3-z1)*x2
   b2=((w2-w1)*x3-(w3-w1)*x2)/2.0

   # a * z ^2 + b * z + c = 0
   a=a1*a1+a2*a2+dnm*dnm
   b=2.0*(a1*b1+a2*(b2-y1*dnm)-z1*dnm*dnm)
   c=(b2-y1*dnm)*(b2-y1*dnm)+b1*b1+dnm*dnm*(z1*z1-re*re)

   # discriminante
   d=b*b-4.0*a*c
   if d<0.0:
      print("discriminante - directo error")
      return [1,0,0,0]

   z0=-0.5*(b+math.sqrt(d))/a
   x0=(a1*z0+b1)/dnm
   y0=(a2*z0+b2)/dnm

   y0*=mtmm
   x0*=mtmm
   z0*=mtmm
   return [0,x0,y0,z0]

###############################################
####### [ Cinematica Inversa ] ################
###############################################

# ******************************************
# ****** {{{ Inversa }}} *******************
# ******************************************
def inverse(x0,y0,z0):
   y0*=mmtm
   x0*=mmtm
   z0*=mmtm

   theta1=0
   theta2=0
   theta3=0

   #Rotacion(0, 120, 240)
   status=angle_yz(x0,y0,z0)

   if status[0]== 0:
      theta2=status[1]
      status=angle_yz(x0*cos120+y0*sin120,y0*cos120-x0*sin120,z0,theta2)

   if status[0]== 0:
      theta3=status[1]
      status=angle_yz(x0*cos120-y0*sin120,y0*cos120+x0*sin120,z0,theta3)
   
   theta1=status[1]

   return [status[0],theta1,theta2,theta3]

# ******************************************
# ****** {{{ Plano YZ }}} ******************
# ******************************************
def angle_yz(x0,y0,z0,theta=None):
   y1=-0.5*tan30*f
   y0=y0-0.5*tan30*e
   # z = a + b*y
   a=(x0*x0+y0*y0+z0*z0+rf*rf-re*re-y1*y1)/(2.0*z0)
   b=(y1-y0)/z0
   
   # discriminante
   #d=-(a+b*y1)*(a+b*y1)+rf*(b*b*rf+rf)
   d=((-1)*(a+b*y1)*(a+b*y1))+(rf*rf*(b*b+1.0))

   if d<0:
      print("discriminante - angle_yz")
      return [1,0] # error inversa
   
   yj=((y1-a*b)-math.sqrt(d))/(b*b+1.0)
   zj=a+b*yj

   if ((y1-yj)!=0.0):
	theta=math.atan(((-1)*(zj))/(abs(y1-yj)))
  	if (yj<y1):
		theta=theta*(rtd)
  	else:
		if zj<0:
			theta=theta*(180.0/pi)
			theta=180.0-theta
		else:
			theta=theta*(180.0/pi)
			theta=(-1.0*180.0)+theta
   else:
	if zj<0:
		theta=90.0
	else:
		theta=-90.0

   return [0,theta]

# ******************************************
# ****** {{{ Inversa Matricial }}} *********
# ******************************************
def inverse_m(p0x_m,p0y_m,p0z_m):
	tamano=len(p0x_m)
	theta1_m=np.zeros((1,tamano))
	theta2_m=np.zeros((1,tamano))
	theta3_m=np.zeros((1,tamano))
	for i in range(0,tamano):
		theta_m=inverse(p0x_m[i],p0y_m[i],p0z_m[i])
		#print(theta_m)
		theta1_m[0,i]=theta_m[1]
		theta2_m[0,i]=theta_m[2]
		theta3_m[0,i]=theta_m[3]
	return [theta1_m[0],theta2_m[0],theta3_m[0]]

