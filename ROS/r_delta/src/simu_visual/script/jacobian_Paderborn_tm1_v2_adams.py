# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Determinar Jacobiano Metodo B

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
e = pd_tm1_adams.e()
f = pd_tm1_adams.f()
re = pd_tm1_adams.l2()
rf = pd_tm1_adams.l1()
ra = pd_tm1_adams.ra()
rb = pd_tm1_adams.rb()
R = ra - rb

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
rtd = pd_tm1_adams.rtd()

###############################################
########### [Jacobian Total] ##################
###############################################

# |-----------------------------------|
# |------- jacobian Paderborn --------|
# |-----------------------------------|
def jacobian_calculo_Paderborn(pox, poy, poz,
                               thetai1, thetai2, thetai3):
    # Cambio unidades Internacional
    pxx = pox * mmtm
    pyy = poy * mmtm
    pzz = poz * mmtm

    # Ordenar segun sistema LOCAL
    punto = [-pyy, pxx, pzz]
    phi_orden = [0 * dtr, 120 * dtr, 240 * dtr]
    thetai_orden = [thetai2 * dtr, thetai3 * dtr, thetai1 * dtr]

    s1 = si(punto[0], punto[1], punto[2], phi_orden[0], thetai_orden[0])
    s2 = si(punto[0], punto[1], punto[2], phi_orden[1], thetai_orden[1])
    s3 = si(punto[0], punto[1], punto[2], phi_orden[2], thetai_orden[2])

    s1t = np.transpose(s1)
    s2t = np.transpose(s2)
    s3t = np.transpose(s3)

    b1 = bi(phi_orden[0], thetai_orden[0])
    b2 = bi(phi_orden[1], thetai_orden[1])
    b3 = bi(phi_orden[2], thetai_orden[2])

    jx = np.zeros((3, 3))
    jtheta = np.zeros((3, 3))

    jx[0, 0] = s1t[0, 0]
    jx[0, 1] = s1t[0, 1]
    jx[0, 2] = s1t[0, 2]

    jx[1, 0] = s2t[0, 0]
    jx[1, 1] = s2t[0, 1]
    jx[1, 2] = s2t[0, 2]

    jx[2, 0] = s3t[0, 0]
    jx[2, 1] = s3t[0, 1]
    jx[2, 2] = s3t[0, 2]

    jtheta[0, 0] = np.dot(s1t, b1)
    jtheta[1, 1] = np.dot(s2t, b2)
    jtheta[2, 2] = np.dot(s3t, b3)

    jtheta = jtheta * (-1.0)

    Jtotal = (np.linalg.inv(jx)).dot(jtheta)

    return [jx, jtheta, Jtotal]

###################################################
#### [ Funciones interiores de Jacobian Total] ####
###################################################
# |-----------------------------------|
# |-------------- Si -----------------|
# |-----------------------------------|
# Matriz si, devuelve matriz 3x1
def si(pox, poy, poz,
       phi,
       thetai):
    angle_brazo = thetai
    si_1 = np.zeros((3, 1))
    si_2 = np.zeros((3, 1))

    si_1[0, 0] = pox
    si_1[1, 0] = poy
    si_1[2, 0] = poz

    si_2[0, 0] = (R) + (rf * math.cos(angle_brazo))
    si_2[1, 0] = 0.0
    si_2[2, 0] = (-1.0) * rf * math.sin(angle_brazo)

    si = (si_1) - (np.dot((matri_rot(phi)), si_2))

    return si

# |-----------------------------------|
# |--------------- Bi ----------------|
# |-----------------------------------|
# Matriz bi devuelve matriz 3x1
def bi(phi, thetai):
    angle_brazo = thetai
    bi_1 = np.zeros((3, 1))

    bi_1[0, 0] = (-1.0) * rf * math.sin(angle_brazo)
    bi_1[1, 0] = 0.0
    bi_1[2, 0] = (-1.0) * rf * math.cos(angle_brazo)

    bi_matrix = np.dot(matri_rot(phi), bi_1)

    bi_matrix = (-1.0) * bi_matrix
    return bi_matrix

# |-----------------------------------|
# |------ Matriz de Rotacion ---------|
# |-----------------------------------|
def matri_rot(phi):
    angle_motor = phi
    Rot = np.zeros((3, 3))

    Rot[0, 0] = math.cos(angle_motor)
    Rot[0, 1] = (-1.0) * math.sin(angle_motor)
    Rot[1, 0] = math.sin(angle_motor)
    Rot[1, 1] = math.cos(angle_motor)
    Rot[2, 2] = (1.0)
    return Rot

###############################################
########### [Jacobian Total Matricial] ########
###############################################
def jacobian_total_mvel(m_px, m_py, m_pz,
                        m_theta11, m_theta12, m_theta13,
                        m_der_theta11, m_der_theta12, m_der_theta13):
    global dtr
    global mmtm

    tamano = len(m_px)
    m_velx = np.zeros((tamano))
    m_vely = np.zeros((tamano))
    m_velz = np.zeros((tamano))

    m_vel = np.zeros((3, 1))
    m_thetas = np.zeros((3, 1))

    for i in range(0, tamano - 1):
        # NO Cambiar a SI
        m_theta1d = m_theta11[i] * (1)
        m_theta2d = m_theta12[i] * (1)
        m_theta3d = m_theta13[i] * (1)

        # Jacobiano
        [jx, jtheta, Jtotal] = jacobian_calculo_Paderborn(m_px[i], m_py[i], m_pz[i],
                                                          m_theta1d, m_theta2d, m_theta3d)

        # Matriz Velocida Angular Thetas
        # Cambiar a SI
        m_thetas[0, 0] = (m_der_theta12[i] * (+1)) * (dtr)
        m_thetas[1, 0] = (m_der_theta13[i] * (+1)) * (dtr)
        m_thetas[2, 0] = (m_der_theta11[i] * (+1)) * (dtr)

        # Vxyz=J*Vthetas
        m_vel = Jtotal.dot(m_thetas)

        # Cambiar a sistemas de Referencia Global XYZ
        m_velx[i] = (+1) * m_vel[1, 0]
        m_vely[i] = (-1) * m_vel[0, 0]
        m_velz[i] = (+1) * m_vel[2, 0]

    # Cambiar salida [mm/s]
    return [m_velx * mtmm, m_vely * mtmm, m_velz * mtmm]

###############################################
###### [ Jacobian Derivadas Total  ] ##########
###############################################
# |-----------------------------------|
# |--- jacobian_total_tm1 (PUNTUAL) --|
# |-----------------------------------|
def jacobian_total_tm1(pox, poy, poz,
                       thetai1, thetai2, thetai3,
                       pox_p, poy_p, poz_p):
    # Cambio unidades Internacional
    pxx = pox * mmtm
    pyy = poy * mmtm
    pzz = poz * mmtm

    pxx_p = pox_p * mmtm
    pyy_p = poy_p * mmtm
    pzz_p = poz_p * mmtm

    # Ordenar segun sistema referencia LOCAL
    punto = [-pyy, pxx, pzz]
    phi_orden = [0 * dtr, 120 * dtr, 240 * dtr]
    thetai_orden = [thetai2 * dtr, thetai3 * dtr, thetai1 * dtr]
    punto_p_i = [-pyy_p, pxx_p, pzz_p]

    s1 = si(punto[0], punto[1], punto[2], phi_orden[0], thetai_orden[0])
    s2 = si(punto[0], punto[1], punto[2], phi_orden[1], thetai_orden[1])
    s3 = si(punto[0], punto[1], punto[2], phi_orden[2], thetai_orden[2])

    s1t = np.transpose(s1)
    s2t = np.transpose(s2)
    s3t = np.transpose(s3)

    b1 = bi(phi_orden[0], thetai_orden[0])
    b2 = bi(phi_orden[1], thetai_orden[1])
    b3 = bi(phi_orden[2], thetai_orden[2])

    jx = np.zeros((3, 3))
    jtheta = np.zeros((3, 3))

    sitt = np.zeros((3, 3))

    sitt[0, 0] = s1t[0, 0]
    sitt[0, 1] = s1t[0, 1]
    sitt[0, 2] = s1t[0, 2]

    sitt[1, 0] = s2t[0, 0]
    sitt[1, 1] = s2t[0, 1]
    sitt[1, 2] = s2t[0, 2]

    sitt[2, 0] = s3t[0, 0]
    sitt[2, 1] = s3t[0, 1]
    sitt[2, 2] = s3t[0, 2]

    jx[0, 0] = s1t[0, 0]
    jx[0, 1] = s1t[0, 1]
    jx[0, 2] = s1t[0, 2]

    jx[1, 0] = s2t[0, 0]
    jx[1, 1] = s2t[0, 1]
    jx[1, 2] = s2t[0, 2]

    jx[2, 0] = s3t[0, 0]
    jx[2, 1] = s3t[0, 1]
    jx[2, 2] = s3t[0, 2]

    jtheta[0, 0] = np.dot(s1t, b1)
    jtheta[1, 1] = np.dot(s2t, b2)
    jtheta[2, 2] = np.dot(s3t, b3)

    jtheta = jtheta * (-1.0)

    Jtotal = ((np.linalg.inv(jx)).dot(jtheta))

    Jtotal_inv = np.linalg.inv(Jtotal)
    thetai_p = Jtotal_inv.dot([[punto_p_i[0]], [punto_p_i[1]], [punto_p_i[2]]])

    punto_p = np.zeros(3)
    punto_p[0] = punto_p_i[0]
    punto_p[1] = punto_p_i[1]
    punto_p[2] = punto_p_i[2]

    s1_p = si_p(punto_p[0], punto_p[1], punto_p[2],
        phi_orden[0], thetai_orden[0], thetai_p[0])
    s2_p = si_p(punto_p[0], punto_p[1], punto_p[2],
        phi_orden[1], thetai_orden[1], thetai_p[1])
    s3_p = si_p(punto_p[0], punto_p[1], punto_p[2],
        phi_orden[2], thetai_orden[2], thetai_p[2])

    s1t_p = np.transpose(s1_p)
    s2t_p = np.transpose(s2_p)
    s3t_p = np.transpose(s3_p)

    b1_p = bi_p(phi_orden[0], thetai_orden[0], thetai_p[0])
    b2_p = bi_p(phi_orden[1], thetai_orden[1], thetai_p[1])
    b3_p = bi_p(phi_orden[2], thetai_orden[2], thetai_p[2])

    sit_p = np.zeros((3, 3))
    K_p = np.zeros((3, 3))

    sit_p[0, 0] = s1t_p[0, 0]
    sit_p[0, 1] = s1t_p[0, 1]
    sit_p[0, 2] = s1t_p[0, 2]

    sit_p[1, 0] = s2t_p[0, 0]
    sit_p[1, 1] = s2t_p[0, 1]
    sit_p[1, 2] = s2t_p[0, 2]

    sit_p[2, 0] = s3t_p[0, 0]
    sit_p[2, 1] = s3t_p[0, 1]
    sit_p[2, 2] = s3t_p[0, 2]

    K_p[0, 0] = (np.dot(s1t_p, b1)) + (np.dot(s1t, b1_p))
    K_p[1, 1] = (np.dot(s2t_p, b2)) + (np.dot(s2t, b2_p))
    K_p[2, 2] = (np.dot(s3t_p, b3)) + (np.dot(s3t, b3_p))

    return [jx, jtheta, Jtotal, sit_p, K_p, thetai_p, sitt]

######################################################
# [ Funciones interiores de Jacobian Derivada Total] #
######################################################
# |-----------------------------------|
# |----------- Si Punto --------------|
# |-----------------------------------|
# Derivadad de Si
def si_p(px_p, py_p, pz_p,
         phi,
         thetai, thetai_p):
    angle_brazo = thetai
    vel_brazo = thetai_p
    si_1 = np.zeros((3, 1))
    si_2 = np.zeros((3, 1))

    si_1[0, 0] = px_p
    si_1[1, 0] = py_p
    si_1[2, 0] = pz_p

    si_2[0, 0] = (rf * math.sin(angle_brazo)) * (vel_brazo)
    si_2[1, 0] = 0.0
    si_2[2, 0] = (rf * math.cos(angle_brazo)) * (vel_brazo)

    si = (si_1) + (np.dot((matri_rot(phi)), si_2))
    return si

# |-----------------------------------|
# |----------- Bi Punto --------------|
# |-----------------------------------|
# Derivada de Bi
def bi_p(phi, thetai, thetai_p):
    angle_brazo = thetai
    vel_brazo = thetai_p
    bi_1 = np.zeros((3, 1))

    bi_1[0, 0] = (1.0) * (rf * math.cos(angle_brazo)) * (vel_brazo)
    bi_1[1, 0] = 0.0
    bi_1[2, 0] = (-1.0) * (rf * math.sin(angle_brazo)) * (vel_brazo)

    bi_matrix = np.dot(matri_rot(phi), bi_1)

    bi_matrix = (1.0) * bi_matrix
    return bi_matrix

###############################################
### [ Jacobian Total Aceleracion Matricial] ###
###############################################
def jacobian_total_macel(m_px, m_py, m_pz,
                         m_px_p, m_py_p, m_pz_p,
                         m_theta11, m_theta12, m_theta13,
                         m_pxpp, m_pypp, m_pzpp):
    global dtr
    global mmtm
    global rtd

    tamano = len(m_px)
    # Para Guardar Acleraciones thetas
    m_acelth1 = np.zeros((tamano))
    m_acelth2 = np.zeros((tamano))
    m_acelth3 = np.zeros((tamano))

    # Para Guardar velocidad thetas
    m_th1_p = np.zeros((tamano))
    m_th2_p = np.zeros((tamano))
    m_th3_p = np.zeros((tamano))

    # Para Guardar Jacobianos
    m_jac = np.zeros((tamano, 9))

    # Para multiplicar matricialemnte, son momentaneas
    m_acelth = np.zeros((3, 1))
    m_thetas = np.zeros((3, 1))
    m_velxyz = np.zeros((3, 1))
    m_acelxyz = np.zeros((3, 1))

    # Para Guardar Jacobianos
    m_jac_der = np.zeros((tamano, 9))

    for i in range(0, tamano):
        # Jacobiano
        [jx, jtheta, Jtotal,
         si_p, K_p, thetai_p, si] = jacobian_total_tm1(m_px[i], m_py[i], m_pz[i],
            m_theta11[i], m_theta12[i], m_theta13[i],
            m_px_p[i], m_py_p[i], m_pz_p[i])

        # Matriz Velocida Angular Thetas
        m_thetas = thetai_p

        # Guardar jacobiano para torque
        m_jac[i, 0] = Jtotal[0, 0]
        m_jac[i, 1] = Jtotal[0, 1]
        m_jac[i, 2] = Jtotal[0, 2]
        m_jac[i, 3] = Jtotal[1, 0]
        m_jac[i, 4] = Jtotal[1, 1]
        m_jac[i, 5] = Jtotal[1, 2]
        m_jac[i, 6] = Jtotal[2, 0]
        m_jac[i, 7] = Jtotal[2, 1]
        m_jac[i, 8] = Jtotal[2, 2]

        # Cambiar a SI
        m_acelxyz[0, 0] = (-m_pypp[i]) * (mmtm)
        m_acelxyz[1, 0] = (m_pxpp[i]) * (mmtm)
        m_acelxyz[2, 0] = (m_pzpp[i]) * (mmtm)

        # aceleracion thetas
        A = inv(Jtotal)
        B1 = m_acelxyz
        C1 = inv(jx)
        C2 = ((si_p).dot(Jtotal)) + (K_p)
        B2 = ((C1).dot(C2)).dot(m_thetas)
        B = (B1 + B2)
        m_acelth = (A).dot(B)

        # Jacobiano Derivada
        Jder = (-1) * (inv(si)).dot(((si_p).dot(Jtotal)) + (K_p))
        # guardar jacobiano
        m_jac_der[i, 0] = Jder[0, 0]
        m_jac_der[i, 1] = Jder[0, 1]
        m_jac_der[i, 2] = Jder[0, 2]
        m_jac_der[i, 3] = Jder[1, 0]
        m_jac_der[i, 4] = Jder[1, 1]
        m_jac_der[i, 5] = Jder[1, 2]
        m_jac_der[i, 6] = Jder[2, 0]
        m_jac_der[i, 7] = Jder[2, 1]
        m_jac_der[i, 8] = Jder[2, 2]

        # Cambiar a sistemas de Referencia Global XYZ
        m_acelth1[i] = (+1) * m_acelth[2, 0]
        m_acelth2[i] = (+1) * m_acelth[0, 0]
        m_acelth3[i] = (+1) * m_acelth[1, 0]

        # Guardar thetas velocidad resultado ya esta ordenado
        # desde jacobian total para el sistema Metodo B
        m_th1_p[i] = m_thetas[2]
        m_th2_p[i] = m_thetas[0]
        m_th3_p[i] = m_thetas[1]

    # Cambiar salida [mm/s] Y grados
    return [m_th1_p * rtd, m_th2_p * rtd, m_th3_p * rtd,
            m_jac, m_jac_der,
            m_acelth1 * rtd, m_acelth2 * rtd, m_acelth3 * rtd]

#############   FIN   #########################
