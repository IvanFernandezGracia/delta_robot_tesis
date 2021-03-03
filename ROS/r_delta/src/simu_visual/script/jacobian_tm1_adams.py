# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Determinar Jacobiano Metodo A

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import pd_tm1_adams
import numpy as np
from numpy.linalg import inv
import time

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

dtr = pd_tm1_adams.dtr()
mtmm = pd_tm1_adams.mtmm()
mmtm = pd_tm1_adams.mmtm()
rtd = pd_tm1_adams.rtd()


###############################################
########### [Jacobian Total] ##################
###############################################
def jacobian_total(px, py, pz,
                   theta11, theta12, theta13):
    # Cambio unidades Internacional
    pxx = px * mmtm
    pyy = py * mmtm
    pzz = pz * mmtm

    # Ordenar segun  sistema LOCAL
    punto = [-pyy, -pxx, -pzz]
    phi_orden = [0, 120, 240]
    thetai_orden = [theta12, theta11, theta13]

    jxx = np.zeros((3, 3))
    jinv = np.zeros((3, 3))

    # Angulo theta3i
    theta31 = calculo_theta3i(phi_orden[0], punto[0], punto[1])
    theta32 = calculo_theta3i(phi_orden[1], punto[0], punto[1])
    theta33 = calculo_theta3i(phi_orden[2], punto[0], punto[1])

    # Angulo theta2i
    theta21 = calculo_theta2i(phi_orden[0], punto[0], punto[1], punto[2], theta31)
    theta22 = calculo_theta2i(phi_orden[1], punto[0], punto[1], punto[2], theta32)
    theta23 = calculo_theta2i(phi_orden[2], punto[0], punto[1], punto[2], theta33)

    # Jacobiano directo (jix)
    jxx[0, 0] = calculo_jix(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 0] = calculo_jix(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 0] = calculo_jix(phi_orden[2], thetai_orden[2], theta23, theta33)

    jxx[0, 1] = calculo_jiy(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 1] = calculo_jiy(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 1] = calculo_jiy(phi_orden[2], thetai_orden[2], theta23, theta33)

    jxx[0, 2] = calculo_jiz(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 2] = calculo_jiz(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 2] = calculo_jiz(phi_orden[2], thetai_orden[2], theta23, theta33)

    # Jacobiano inverso (jinv)
    jinv[0, 0] = calculo_jtheta1(phi_orden[0], theta21, theta31)
    jinv[1, 1] = calculo_jtheta2(phi_orden[1], theta22, theta32)
    jinv[2, 2] = calculo_jtheta3(phi_orden[2], theta23, theta33)

    Jtotal = np.dot(inv(jxx), ((1.0) * jinv))

    return [jinv, jxx, theta31, theta32, theta33, theta21, theta22, theta23, Jtotal]


###############################################
####### [ Angulos theta2i ,theta3i ] ##########
###############################################

# |-----------------------------------|
# |------------- theta3i -------------| 
# |--------------------------------- -|
def calculo_theta3i(phi_deg,
                    px, py):
    phi = phi_deg * dtr

    cyi = ((-px) * (math.sin(phi))) + ((py) * (math.cos(phi)))
    b = re
    theta3i_rad = math.acos(cyi / b)

    theta3i = theta3i_rad / dtr
    return theta3i


# |-----------------------------------|
# |------------- theta2i -------------| 
# |--------------------------------- -|
def calculo_theta2i(phi_deg,
                    px, py, pz,
                    theta3i_deg):
    phi = phi_deg * dtr

    r_efector = (e / 2.0) * (tan30)
    R_fija = (f / 2.0) * (tan30)

    cxi = ((px) * (math.cos(phi))) + ((py) * (math.sin(phi))) + (r_efector) - (R_fija)
    cyi = ((-px) * (math.sin(phi))) + ((py) * (math.cos(phi)))
    czi = pz

    aa = rf
    bb = re

    theta3i = theta3i_deg * dtr

    A = ((cxi ** 2.0) + (cyi ** 2.0) + (czi ** 2.0)) - ((aa ** 2.0) + (bb ** 2.0))
    B = 2.0 * aa * bb * (math.sin(theta3i))

    theta2i_rad = math.acos(A / B)
    theta2i = theta2i_rad / dtr

    return theta2i


######################################################
###### [ Jacobian cinematica directa Ji(xyz) ] #######
######################################################

# |------------------------------|
# |------------- Jix ------------| 
# |------------------------------|
def calculo_jix(phi_deg,
                theta1i_deg, theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    A = (math.cos(theta1i + theta2i)) * (math.sin(theta3i)) * (math.cos(phi))
    B = (math.cos(theta3i)) * (math.sin(phi))
    jix = (A) - (B)
    return jix


# |------------------------------|
# |------------- Jiy ------------| 
# |------------------------------|
def calculo_jiy(phi_deg,
                theta1i_deg, theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    A = (math.cos(theta1i + theta2i)) * (math.sin(theta3i)) * (math.sin(phi))
    B = (math.cos(theta3i)) * (math.cos(phi))
    jiy = (A) + (B)
    return jiy


# |------------------------------|
# |------------- Jiz ------------| 
# |------------------------------|
def calculo_jiz(phi_deg,
                theta1i_deg, theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    jiz = (math.sin(theta3i)) * (math.sin(theta1i + theta2i))
    return jiz


######################################################
#### [ Jacobian cinematica inversa angular Jtheta] ###
######################################################

# |------------------------------|
# |------------- jtheta1 --------| 
# |------------------------------|
def calculo_jtheta1(phi_deg,
                    theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr  # Motor 1
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    aa = rf

    jtheta1 = (aa) * (math.sin(theta2i)) * (math.sin(theta3i))
    return jtheta1


# |------------------------------|
# |------------- jtheta2 --------| 
# |------------------------------|
def calculo_jtheta2(phi_deg,
                    theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr  # Motor 2
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    aa = rf
    jtheta2 = (aa) * (math.sin(theta2i)) * (math.sin(theta3i))
    return jtheta2


# |------------------------------|
# |------------- jtheta3 --------| 
# |------------------------------|
def calculo_jtheta3(phi_deg,
                    theta2i_deg, theta3i_deg):
    phi = phi_deg * dtr  # Motor 3
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    aa = rf

    jtheta3 = (aa) * (math.sin(theta2i)) * (math.sin(theta3i))
    return jtheta3


###############################################
###### [ Jacobian Derivadas Total  ] ##########
###############################################

# |-----------------------------------|
# |------- jacobian_total_der --------|
# |-----------------------------------|
def jacobian_total_der(px, py, pz,
                       theta11, theta12, theta13,
                       px_p, py_p, pz_p):
    # Cambio unidades Internacional
    pxx = px * mmtm
    pyy = py * mmtm
    pzz = pz * mmtm

    pxx_p = px_p * mmtm
    pyy_p = py_p * mmtm
    pzz_p = pz_p * mmtm

    # Ordenar segun sistema LOCAL
    punto = [-pyy, -pxx, -pzz]
    punto_p = [-pyy_p, -pxx_p, -pzz_p]
    phi_orden = [0, 120, 240]
    thetai_orden = [theta12, theta11, theta13]

    jxx = np.zeros((3, 3))
    jinv = np.zeros((3, 3))
    jxx_der = np.zeros((3, 3))
    jinv_der = np.zeros((3, 3))

    # Angulo theta3i
    theta31 = calculo_theta3i(phi_orden[0], punto[0], punto[1])
    theta32 = calculo_theta3i(phi_orden[1], punto[0], punto[1])
    theta33 = calculo_theta3i(phi_orden[2], punto[0], punto[1])

    # Angulo theta2i
    theta21 = calculo_theta2i(phi_orden[0], punto[0], punto[1], punto[2], theta31)
    theta22 = calculo_theta2i(phi_orden[1], punto[0], punto[1], punto[2], theta32)
    theta23 = calculo_theta2i(phi_orden[2], punto[0], punto[1], punto[2], theta33)

    # Jacobiano directo (jix)
    jxx[0, 0] = calculo_jix(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 0] = calculo_jix(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 0] = calculo_jix(phi_orden[2], thetai_orden[2], theta23, theta33)

    jxx[0, 1] = calculo_jiy(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 1] = calculo_jiy(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 1] = calculo_jiy(phi_orden[2], thetai_orden[2], theta23, theta33)

    jxx[0, 2] = calculo_jiz(phi_orden[0], thetai_orden[0], theta21, theta31)
    jxx[1, 2] = calculo_jiz(phi_orden[1], thetai_orden[1], theta22, theta32)
    jxx[2, 2] = calculo_jiz(phi_orden[2], thetai_orden[2], theta23, theta33)

    # Jacobiano inverso (jinv)
    jinv[0, 0] = calculo_jtheta1(phi_orden[0], theta21, theta31)
    jinv[1, 1] = calculo_jtheta2(phi_orden[1], theta22, theta32)
    jinv[2, 2] = calculo_jtheta3(phi_orden[2], theta23, theta33)

    Jtotal_inv = np.dot(inv(jinv), ((1.0) * jxx))

    theta1i_p = Jtotal_inv.dot([[punto_p[0]], [punto_p[1]], [punto_p[2]]])
    theta1i_p = theta1i_p * (rtd)

    # Velocidad theta3i
    theta31_p = calculo_theta3i_der(phi_orden[0],
        punto[0], punto[1], punto_p[0], punto_p[1])
    theta32_p = calculo_theta3i_der(phi_orden[1],
        punto[0], punto[1], punto_p[0], punto_p[1])
    theta33_p = calculo_theta3i_der(phi_orden[2],
        punto[0], punto[1], punto_p[0], punto_p[1])

    # Velocidad theta2i
    theta21_p = calculo_theta2i_der(phi_orden[0],
                                    punto[0], punto[1], punto[2],
                                    theta31, theta31_p, punto_p[0],
                                    punto_p[1], punto_p[2])
    theta22_p = calculo_theta2i_der(phi_orden[1],
                                    punto[0], punto[1], punto[2],
                                    theta32, theta32_p, punto_p[0],
                                    punto_p[1], punto_p[2])
    theta23_p = calculo_theta2i_der(phi_orden[2],
                                    punto[0], punto[1], punto[2],
                                    theta33, theta33_p, punto_p[0],
                                    punto_p[1], punto_p[2])

    # Jacobiano directo derivada (jix)
    jxx_der[0, 0] = calculo_jix_der(phi_orden[0],
                                    thetai_orden[0], theta21, theta31,
                                    theta1i_p[0, 0], theta21_p, theta31_p)
    jxx_der[1, 0] = calculo_jix_der(phi_orden[1],
                                    thetai_orden[1], theta22, theta32,
                                    theta1i_p[1, 0], theta22_p, theta32_p)
    jxx_der[2, 0] = calculo_jix_der(phi_orden[2],
                                    thetai_orden[2], theta23, theta33,
                                    theta1i_p[2, 0], theta23_p, theta33_p)

    jxx_der[0, 1] = calculo_jiy_der(phi_orden[0],
                                    thetai_orden[0], theta21, theta31,
                                    theta1i_p[0, 0], theta21_p, theta31_p)
    jxx_der[1, 1] = calculo_jiy_der(phi_orden[1],
                                    thetai_orden[1], theta22, theta32,
                                    theta1i_p[1, 0], theta22_p, theta32_p)
    jxx_der[2, 1] = calculo_jiy_der(phi_orden[2],
                                    thetai_orden[2], theta23, theta33,
                                    theta1i_p[2, 0], theta23_p, theta33_p)

    jxx_der[0, 2] = calculo_jiz_der(phi_orden[0],
                                    thetai_orden[0], theta21, theta31,
                                    theta1i_p[0, 0], theta21_p, theta31_p)
    jxx_der[1, 2] = calculo_jiz_der(phi_orden[1],
                                    thetai_orden[1], theta22, theta32,
                                    theta1i_p[1, 0], theta22_p, theta32_p)
    jxx_der[2, 2] = calculo_jiz_der(phi_orden[2],
                                    thetai_orden[2], theta23, theta33,
                                    theta1i_p[2, 0], theta23_p, theta33_p)

    # Jacobiano inverso derivada (jinv)
    jinv_der[0, 0] = calculo_jtheta1_der(phi_orden[0],
                                         theta21, theta31,
                                         theta21_p, theta31_p)
    jinv_der[1, 1] = calculo_jtheta2_der(phi_orden[1],
                                         theta22, theta32,
                                         theta22_p, theta32_p)
    jinv_der[2, 2] = calculo_jtheta3_der(phi_orden[2],
                                         theta23, theta33,
                                         theta23_p, theta33_p)

    return [jinv, jxx, jinv_der, jxx_der,
            theta31, theta32, theta33,
            theta21, theta22, theta23]

##############################################
####### [ Derivada theta2i ,theta3i ] ########
##############################################

# |-----------------------------------|
# |-------- Derivada theta3i ---------|
# |--------------------------------- -|
def calculo_theta3i_der(phi_deg,
                        px, py,
                        px_p, py_p):
    phi = phi_deg * dtr

    cyi = ((-px) * (math.sin(phi))) + ((py) * (math.cos(phi)))
    b = re

    cyi_p = ((-px_p) * (math.sin(phi))) + ((py_p) * (math.cos(phi)))

    A = (cyi_p) / (b)
    B = math.sqrt((1.0) - (((cyi) / (b)) ** 2.0))

    theta3i_p_rad = (-1.0) * ((A) / (B))

    theta3i_p = theta3i_p_rad / dtr
    return theta3i_p


# |-----------------------------------|
# |-------- Derivada theta2i ---------|
# |--------------------------------- -|
def calculo_theta2i_der(phi_deg,
                        px, py, pz,
                        theta3i_deg, theta3i_p_deg,
                        px_p, py_p, pz_p):
    phi = phi_deg * dtr

    r_efector = (e / 2.0) * (tan30)
    R_fija = (f / 2.0) * (tan30)

    cxi = ((px) * (math.cos(phi))) + ((py) * (math.sin(phi))) + (r_efector) - (R_fija)
    cyi = ((-px) * (math.sin(phi))) + ((py) * (math.cos(phi)))
    czi = pz

    cxi_p = ((px_p) * (math.cos(phi))) + ((py_p) * (math.sin(phi)))
    cyi_p = ((-px_p) * (math.sin(phi))) + ((py_p) * (math.cos(phi)))
    czi_p = pz_p

    aa = rf
    bb = re

    theta3i = theta3i_deg * dtr
    theta3i_p = theta3i_p_deg * dtr

    A11 = ((2.0 * ((cxi * cxi_p) + (cyi * cyi_p) + (czi * czi_p))) * (math.sin(theta3i)))
    A12 = (((cxi ** 2.0) + (cyi ** 2.0) + (czi ** 2.0)) -
           ((aa ** 2.0) + (bb ** 2.0))) * (math.cos(theta3i)) * (theta3i_p)
    B1 = (math.sin(theta3i)) ** 2.0

    kprima = (1.0 / (2.0 * aa * bb)) * (((A11) - (A12)) / (B1))

    A2 = ((cxi ** 2.0) + (cyi ** 2.0) + (czi ** 2.0)) - ((aa ** 2.0) + (bb ** 2.0))
    B2 = 2.0 * aa * bb * (math.sin(theta3i))
    k = A2 / B2

    A = kprima
    B = math.sqrt((1.0) - ((k) ** 2.0))

    theta2i_p_rad = (-1.0) * ((A) / (B))

    theta2i_p = theta2i_p_rad / dtr

    return theta2i_p


###############################################
####### [ Derivada Ji(xyz)] ###################
###############################################

# |----------------------------------|
# |-------- Derivada Jix ------------|
# |----------------------------------|
def calculo_jix_der(phi_deg,
                    theta1i_deg, theta2i_deg, theta3i_deg,
                    theta1i_deg_p, theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    theta1i_p = theta1i_deg_p * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr

    A1 = (-1.0) * (math.sin(theta1i + theta2i)) *\
         (math.sin(theta3i)) * (theta1i_p + theta2i_p)
    A2 = (math.cos(theta1i + theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    A = (math.cos(phi)) * ((A1) + (A2))
    B = (math.sin(phi)) * ((-1.0) * (math.sin(theta3i)) * (theta3i_p))
    jix = (A) - (B)
    return jix


# |----------------------------------|
# |-------- Derivada Jiy ------------|
# |----------------------------------|
def calculo_jiy_der(phi_deg,
                    theta1i_deg, theta2i_deg, theta3i_deg,
                    theta1i_deg_p, theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    theta1i_p = theta1i_deg_p * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr

    A1 = (-1.0) * (math.sin(theta1i + theta2i)) *\
         (math.sin(theta3i)) * (theta1i_p + theta2i_p)
    A2 = (math.cos(theta1i + theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    A = (math.sin(phi)) * ((A1) + (A2))
    B = (math.cos(phi)) * ((-1.0) * (math.sin(theta3i)) * (theta3i_p))
    jiy = (A) + (B)
    return jiy


# |----------------------------------|
# |-------- Derivada Jiz ------------|
# |----------------------------------|
def calculo_jiz_der(phi_deg,
                    theta1i_deg, theta2i_deg, theta3i_deg,
                    theta1i_deg_p, theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr
    theta1i = theta1i_deg * dtr
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr

    theta1i_p = theta1i_deg_p * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr

    A = (math.cos(theta1i + theta2i)) * (math.sin(theta3i)) * ((theta1i_p) + (theta2i_p))
    B = (math.sin(theta1i + theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    jiz = (A) + (B)
    return jiz


###############################################
####### [ Derivada Jtheta] ####################
###############################################

# |--------------------------------------|
# |-------- Derivada jtheta1 ------------|
# |--------------------------------------|
def calculo_jtheta1_der(phi_deg,
                        theta2i_deg, theta3i_deg,
                        theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr  # Motor 1
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr
    aa = rf

    A = (math.cos(theta2i)) * (math.sin(theta3i)) * (theta2i_p)
    B = (math.sin(theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    jtheta1 = (aa) * (A + B)

    return jtheta1


# |--------------------------------------|
# |-------- Derivada jtheta2 ------------|
# |--------------------------------------|
def calculo_jtheta2_der(phi_deg,
                        theta2i_deg, theta3i_deg,
                        theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr  # Motor 2
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr
    aa = rf

    A = (math.cos(theta2i)) * (math.sin(theta3i)) * (theta2i_p)
    B = (math.sin(theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    jtheta2 = (aa) * (A + B)

    return jtheta2


# |--------------------------------------|
# |-------- Derivada jtheta3 ------------|
# |--------------------------------------|
def calculo_jtheta3_der(phi_deg,
                        theta2i_deg, theta3i_deg,
                        theta2i_deg_p, theta3i_deg_p):
    phi = phi_deg * dtr  # Motor 3
    theta2i = theta2i_deg * dtr
    theta3i = theta3i_deg * dtr
    theta2i_p = theta2i_deg_p * dtr
    theta3i_p = theta3i_deg_p * dtr
    aa = rf

    A = (math.cos(theta2i)) * (math.sin(theta3i)) * (theta2i_p)
    B = (math.sin(theta2i)) * (math.cos(theta3i)) * (theta3i_p)
    jtheta3 = (aa) * (A + B)

    return jtheta3


###############################################
### [ Jacobian Total Aceleracion Matricial] ###
###############################################
def jacobian_total_macel(m_px, m_py, m_pz,
                         m_pxp, m_pyp, m_pzp,
                         m_pxpp, m_pypp, m_pzpp,
                         m_theta11, m_theta12, m_theta13):
    global dtr
    global mmtm
    global rtd

    tamano = len(m_px)

    # Guarda Acleraciones thetas
    m_acelth1 = np.zeros((tamano))
    m_acelth2 = np.zeros((tamano))
    m_acelth3 = np.zeros((tamano))

    # Guarda velocidad thetas
    m_th1_p = np.zeros((tamano))
    m_th2_p = np.zeros((tamano))
    m_th3_p = np.zeros((tamano))

    # Para multiplicar matricialemnte, son momentaneas
    m_acelth = np.zeros((3, 1))
    m_thetas = np.zeros((3, 1))
    m_velxyz = np.zeros((3, 1))
    m_acelxyz = np.zeros((3, 1))

    for i in range(0, tamano):
        # Jacobiano
        [jinv, jxx, jinv_der, jxx_der,
         theta31, theta32, theta33,
         theta21, theta22, theta23] = jacobian_total_der(m_px[i], m_py[i], m_pz[i],
            m_theta11[i], m_theta12[i], m_theta13[i],
            m_pxp[i], m_pyp[i], m_pzp[i])

        # Cambiar a SI
        # Cambiar sistema de referencia LOCAL
        m_velxyz[0, 0] = (-m_pyp[i]) * (mmtm)
        m_velxyz[1, 0] = (-m_pxp[i]) * (mmtm)
        m_velxyz[2, 0] = (-m_pzp[i]) * (mmtm)

        # Matriz Velocida Angular Thetas
        # Cambiar a SI
        # Velocidad tetas en sistema de referencia LOCAL
        m_thetas = (inv(jinv)).dot(jxx.dot(m_velxyz))

        # Cambiar a SI
        m_acelxyz[0, 0] = (-m_pypp[i]) * (mmtm)
        m_acelxyz[1, 0] = (-m_pxpp[i]) * (mmtm)
        m_acelxyz[2, 0] = (-m_pzpp[i]) * (mmtm)

        # Vxyz=J*Vthetas
        m_acelth = (inv(jinv)).dot(((jxx_der).dot(m_velxyz)) +
                                   ((jxx).dot(m_acelxyz)) -
                                   ((jinv_der).dot(m_thetas)))

        # Guardar thetas velocidad
        # Cambiar sistema de referencia GLOBAL
        m_th1_p[i] = m_thetas[1, 0]
        m_th2_p[i] = m_thetas[0, 0]
        m_th3_p[i] = m_thetas[2, 0]

        # Cambiar a sistemas de Referencia Global XYZ
        m_acelth1[i] = (+1) * m_acelth[1, 0]
        m_acelth2[i] = (+1) * m_acelth[0, 0]
        m_acelth3[i] = (+1) * m_acelth[2, 0]

    return [m_th1_p * rtd, m_th2_p * rtd, m_th3_p * rtd,
            m_acelth1 * rtd, m_acelth2 * rtd, m_acelth3 * rtd]

#############   FIN   #########################
