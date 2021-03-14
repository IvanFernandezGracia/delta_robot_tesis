#Nombre Creador: Ivan Alejandro Fernandez Gracia
#Universidad: Universidad de Santiago de Chile
#Mail: ivan.fernandez.g@usach.cl
#Objetivo: Parametros para Torque Motores Metodo 1
#Fuentes:
	# Experimental and simulation studies of motion control of a Delta robot using a model-based approach / Yong-Lin Kuo and Peng-Yu Huang
	# Prototipado virtual y cosimulacion aplicado a un manipulador paralelo tipo Delta de tres grados de libertad para estudios de comportamiento cinematico y cinetico / Carlos Andres Mesa Montoya, Marlon Jhair Herrera Lopez, German Andres Holguin Londono Facultad de Ingenieria Mecanica, Universidad Tecnologica de Pereira, Pereira, Colombia

#Importar Librerias
import math

##############################################################################
#Para cada funcion:
#Input: mm , degres	
#ejecutcion: unidades internacionales
#Ouput/plot: mm , degres	
#ejecutcion: unidades

# EXEPCION: Entrada y salidas de Matrices de rotacion en [Radianes] (o [m]) 

# Torque sale en newton y sale en newton

##############################################################################
########################  CAMBIO UNIDADES ##############################
##############################################################################
def dtr():
	valor=math.pi/180.0 #DEGRES TO RAD
	return valor
def rtd():
	valor=180.0 /math.pi #RAD TO DEGRES
	return valor
def mmtm():
	valor=((10.0)**(-3)) #MILIMETER TO METER
	return valor
def mtmm():
	valor=((10.0)**(3)) # METER TO MILIMETER
	return valor
def kgm2tgrmm2():
	valor=((10.0)**(3+6)) # kilogramometro2 a gramomm2
	return valor
##############################################################################
########################  Trigonometric ##############################
##############################################################################
def sqrt3():
	valor=math.sqrt(3.0) 
	return valor
def pi():
	valor=math.pi # [rad]
	return valor
def sin120():
	valor=sqrt3()/2.0
	return valor
def cos120():
	valor=-0.5
	return valor
def tan60():
	valor=sqrt3()
	return valor
def sin30():
	valor=0.5 
	return valor
def tan30():
	valor=1.0/sqrt3()
	return valor
def cos30():
	valor=(sqrt3())/2.0
	return valor

#########################################################################
########################  DIMENSIONAMIENTO ##############################
#########################################################################
# Specific geometry for my delta robot :f
def l2():
	valor=(880.0)*((10.0)**(-3)) # small triangle side [m]
	return valor
def l1():
	valor=(620.0)*((10.0)**(-3)) # support triangle side [m]
	return valor
def rb():
	valor=(50.0)*((10.0)**(-3)) # lower arm length [m]
	return valor
def ra():
	valor=(210.0)*((10.0)**(-3)) # upper arm length [m]
	return valor
def e():
	valor=(2.0*rb())/(tan30())
	return valor
def f():
	valor=(2.0*ra())/(tan30())
	return valor
#Calculos de hf he constantes
def hf():
	valor=math.sqrt(0.75*(f()**2)) # [m]
	return valor
def he():
	valor=math.sqrt(0.75*(e()**2)) # [m]
	return valor

##################################################################
########################  Masas e Inercias #######################
##################################################################
def m1():
	valor=(2213.0)*((10.0)**(-3)) # masa L1 [kg]
	return valor
def m_elbow():
	valor=(0.0)*((10.0)**(-3)) # masa L2 CADA BARRA X2 [kg]
	return valor
def m2():
	valor=(1315.0/2.0)*((10.0)**(-3)) # masa L2 CADA BARRA X2 [kg]     0x00
	return valor
def mp():
	valor=(510.0)*((10.0)**(-3)) # Masa Efector FInal [kg]
	return valor
def inercia_m():
	valor=(0.0)*((10.0)**(-3)) # Masa Efector FInal [kg * m2]
	return valor
def gg():
	valor=(9.81)  # gravedad [m/s2]
	return valor
def r_mass():
	valor=(0.5)  # relacion posicion masas antebrazo lb
	return valor
def com():
	valor=  (l1())  *  ( ((0.5*(m1()))+(m_elbow())+((2)*(r_mass())*(m2())))  / ((1.0*(m1()))+(m_elbow())+((2)*(r_mass())*(m2()))) )  # centro de masa
	#(0.5*(m1()))+(m_elbow())+((2)*(2.0/3.0)*(m2()))
	return valor


