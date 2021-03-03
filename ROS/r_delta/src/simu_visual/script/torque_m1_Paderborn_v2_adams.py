# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Determinar torque metodo B


###############################################
####### [Importar Librerias] ##################
###############################################
import math
import numpy as np
from numpy.linalg import inv
import pd_tm1_adams

###############################################
########### [Parametros] ######################
###############################################
ra = pd_tm1_adams.ra()
rb = pd_tm1_adams.rb()
la = pd_tm1_adams.l1()
lb = pd_tm1_adams.l2()
rdif = (ra - rb)

# Masas e inercias
ma = pd_tm1_adams.m1()
m_elbow = pd_tm1_adams.m_elbow()
mb = pd_tm1_adams.m2()
i_motor = pd_tm1_adams.inercia_m()
g = pd_tm1_adams.gg()
mc = pd_tm1_adams.mp()
r_mass = pd_tm1_adams.r_mass()
com = pd_tm1_adams.com()

# Constantes Trigonometricas
sqrt3 = pd_tm1_adams.sqrt3()
pi = pd_tm1_adams.pi()
sin120 = sqrt3 / 2.0
cos120 = pd_tm1_adams.cos120()
tan60 = sqrt3
sin30 = pd_tm1_adams.sin30()
tan30 = pd_tm1_adams.tan30()

dtr = pd_tm1_adams.dtr()
mtmm = pd_tm1_adams.mtmm()
mmtm = pd_tm1_adams.mmtm()
kgm2tgrmm2 = pd_tm1_adams.kgm2tgrmm2()
rtd = pd_tm1_adams.rtd()


###############################################
######### [Torque Menu Input] #################
###############################################
# |------------------------------------------|
# |------- Torque TOTAL puntual -------------| 
# |------------------------------------------|
def ti(theta11_pp_deg, theta12_pp_deg, theta13_pp_deg,
       theta11_deg, theta12_deg, theta13_deg,
       xp_mm, yp_mm, zp_mm,
       fpx, fpy, fpz,
       JTotal_m, m_playload, JTotal_m_p,
       theta11_p_deg, theta12_p_deg, theta13_p_deg):
    # Cambiar unidades a SI
    # Cambiar orden angulos y coordenadas cartesianas a sistema referencia LOCAL
    phi = [0 * dtr, 120 * dtr, 240 * dtr]
    theta1i_pp = [[theta12_pp_deg * dtr], [theta13_pp_deg * dtr], [theta11_pp_deg * dtr]]
    theta1i = [theta12_deg * dtr, theta13_deg * dtr, theta11_deg * dtr]
    punto = [[-yp_mm * mmtm], [xp_mm * mmtm], [zp_mm * mmtm]]
    fp = [[-fpy], [fpx], [fpz + ((-1) * (g) * (mnt(m_playload)))]]

    theta1i_p = [[theta12_p_deg * dtr], [theta13_p_deg * dtr], [theta11_p_deg * dtr]]

    torques = ti_puntual(theta1i, theta1i_pp, JTotal_m, fp,
        m_playload, JTotal_m_p, theta1i_p)

    return [torques[0, 0], torques[1, 0], torques[2, 0]]


# |------------------------------------------|
# |------- Torque puntual motor i -----------| 
# |------------------------------------------|
def ti_puntual(theta1i, theta1i_pp,
               JTotal, fg, m_playload, Jtotal_der,
               theta1i_p):
    # Torque Mass matrix
    M1 = (inercia_b()).dot(theta1i_pp)
    M2 = (((np.transpose(JTotal)).dot(JTotal)) * (mnt(m_playload))).dot(theta1i_pp)

    # Torque Centrifugal and Coriolis coefficente matrix o force inerciales
    C = (((np.transpose(JTotal)).dot(Jtotal_der)) * (mnt(m_playload))).dot(theta1i_p)

    # Torque Fuerza gravitacional efector
    G1 = (np.transpose(JTotal)).dot(fg)

    # Torque fuerzas gravitacionales de los brazos
    modulo = ((-g) * (com) * ((ma) + (m_elbow) + (2 * r_mass * mb)))
    G2 = np.zeros((3, 1))
    G2[0, 0] = modulo * math.cos(theta1i[0])
    G2[1, 0] = modulo * math.cos(theta1i[1])
    G2[2, 0] = modulo * math.cos(theta1i[2])

    ti_m_2 = (M1)  # Inercia Brazo
    ti_m_3 = (G2)  # Gravedad Brazo-Antebrazo
    ti_m_5 = (-G1)  # Gravedad efector
    ti_m_1 = (C)
    ti_m_4 = (M2)

    # Efector + Inercia Brazo + Gravedad brazo-antebrazo
    ti_m = (ti_m_1 * (1)) + (ti_m_4 * (1)) +\
           (ti_m_5 * (1)) + (ti_m_2 * (1)) + (ti_m_3 * (1))

    return ti_m


#################################################
####### [Matrices Puntuales ] ###################
#################################################
# |--------------------------------------------|
# |--- Matriz de inverica Brazo superior ------|
# |--------------------------------------------|
def inercia_b():
    ib = np.zeros((3, 3))
    i_rot_la = (la ** 2.0) * ((ma) / (3.0))
    i_elbow = (la ** 2.0) * (m_elbow)
    i_rot_lb = (la ** 2.0) * (2.0 * r_mass * mb)
    valor = (i_motor) + (i_rot_la) + (i_elbow) + (i_rot_lb)
    ib[0, 0] = valor
    ib[1, 1] = valor
    ib[2, 2] = valor
    return ib


# |------------------------------------------|
# |------- Masa efector TOTAL    -----------|
# |------------------------------------------|
# masa efector + masa objeto a levantar + masa dividida antebrazo Lb
def mnt(m_playload):
    mass_mnt = mc + m_playload + ((3.0) * (2.0) * (1.0 - r_mass) * (mb))
    return mass_mnt


####################################################
############# [Torque Matricial] ###################
####################################################
# |----------------------------------------|
# |-------- Torque TOTAL ------------------| 
# |----------------------------------------|
def ti_matriz(theta11_pp_deg, theta12_pp_deg, theta13_pp_deg,
              theta11_deg, theta12_deg, theta13_deg,
              xp_mm, yp_mm, zp_mm,
              fpx, fpy, fpz,
              m_jac, m_playload, m_jac_der,
              theta11_p_deg, theta12_p_deg, theta13_p_deg):
    tamano = len(xp_mm)
    tm1 = np.zeros(tamano)
    tm2 = np.zeros(tamano)
    tm3 = np.zeros(tamano)

    for i in range(0, tamano):
        Jtotal = np.zeros((3, 3))

        Jtotal[0, 0] = m_jac[i, 0]
        Jtotal[0, 1] = m_jac[i, 1]
        Jtotal[0, 2] = m_jac[i, 2]
        Jtotal[1, 0] = m_jac[i, 3]
        Jtotal[1, 1] = m_jac[i, 4]
        Jtotal[1, 2] = m_jac[i, 5]
        Jtotal[2, 0] = m_jac[i, 6]
        Jtotal[2, 1] = m_jac[i, 7]
        Jtotal[2, 2] = m_jac[i, 8]

        Jtotal_der = np.zeros((3, 3))

        Jtotal_der[0, 0] = m_jac_der[i, 0]
        Jtotal_der[0, 1] = m_jac_der[i, 1]
        Jtotal_der[0, 2] = m_jac_der[i, 2]
        Jtotal_der[1, 0] = m_jac_der[i, 3]
        Jtotal_der[1, 1] = m_jac_der[i, 4]
        Jtotal_der[1, 2] = m_jac_der[i, 5]
        Jtotal_der[2, 0] = m_jac_der[i, 6]
        Jtotal_der[2, 1] = m_jac_der[i, 7]
        Jtotal_der[2, 2] = m_jac_der[i, 8]

        t231 = ti(theta11_pp_deg[i], theta12_pp_deg[i], theta13_pp_deg[i],
                  theta11_deg[i], theta12_deg[i], theta13_deg[i],
                  xp_mm[i], yp_mm[i], zp_mm[i],
                  fpx[i], fpy[i], fpz[i],
                  Jtotal, m_playload, Jtotal_der,
                  theta11_p_deg[i], theta12_p_deg[i], theta13_p_deg[i])

        # Ordenar torques segun sistema referencia GLOBAL
        tm1[i] = t231[2]
        tm2[i] = t231[0]
        tm3[i] = t231[1]

    return [tm1, tm2, tm3]

##################### FIN #############################
