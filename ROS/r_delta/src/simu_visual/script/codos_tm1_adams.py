# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo:
# Fuentes: Calcular angulos interiores de cada cadena cinematica
# para simular Rviz uan trayectoria

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import pd_tm1_adams

###############################################
########### [Parametros] ######################
###############################################
e = pd_tm1_adams.e()
f = pd_tm1_adams.f()
rf = pd_tm1_adams.l1()
hf = pd_tm1_adams.hf()
he = pd_tm1_adams.he()

dtr = pd_tm1_adams.dtr()

# Puntos iniciales
A1 = [hf / 3, 0, 0]
A2 = [-A1[0] * math.cos(60 * dtr), -A1[0] * math.sin(60 * dtr), 0]
A3 = [A2[0], -A2[1], 0]


###############################################
###### [ punto_codo  (J 1,2,3) ] ##############
###############################################
# |------------------------------------------|
# |---------------- punto_codo  -------------|
# |------------------------------------------|
# Plano XZ
def punto_codo(theta):
    theta *= dtr
    b1 = [A1[0] + rf * math.cos(theta), 0.0, rf * math.sin(theta)]
    return b1


# |------------------------------------------|
# |-------------- rotacion120 ---------------|
# |------------------------------------------|
sin120 = math.sin(120 * dtr)
cos120 = math.cos(120 * dtr)


def rotacion120(ent):
    sal = [0.0, 0.0, 0.0]
    sal[0] = cos120 * ent[0] + sin120 * ent[1]
    sal[1] = -sin120 * ent[0] + cos120 * ent[1]
    sal[2] = ent[2]
    return sal


# |------------------------------------------|
# |---------------- rotacion240 -------------|
# |------------------------------------------|
sin240 = math.sin(240 * dtr)
cos240 = math.cos(240 * dtr)


def rotacion240(ent):
    sal = [0.0, 0.0, 0.0]
    sal[0] = cos240 * ent[0] + sin240 * ent[1]
    sal[1] = -sin240 * ent[0] + cos240 * ent[1]
    sal[2] = ent[2]
    return sal


###############################################
###### [ punto_ee  EE1,2,3 ] ##################
###############################################
# |------------------------------------------|
# |-------------- punto_ee ------------------|
# |------------------------------------------|
# Distancia de Punto centrar efector al punto EE y girar por motor

vhe2 = [he / 3, 0.0, 0.0]
vhe3 = rotacion120(vhe2)
vhe1 = rotacion120(vhe3)

def punto_ee(ee, brazo):
    sal = [0.0, 0.0, 0.0]
    if brazo == 2:
        sal = sumav(ee, vhe2)
    elif brazo == 3:
        sal = sumav(ee, vhe3)
    elif brazo == 1:
        sal = sumav(ee, vhe1)
    return sal

# |------------------------------------------|
# |--------------- sumav --------------------|
# |------------------------------------------|
def sumav(v1, v2):
    s = [0.0, 0.0, 0.0]
    s[0] = v1[0] + v2[0]
    s[1] = v1[1] + v2[1]
    s[2] = v1[2] + v2[2]
    return s


###############################################
######### [ angulos_codo ] ####################
###############################################
# |------------------------------------------|
# |-------------- angulos_codo --------------|
# |------------------------------------------|
def angulos_codo(codo, ee, brazo):
    if brazo == 3:
        codo = rotacion240(codo)
        ee = rotacion240(ee)
    elif brazo == 1:
        codo = rotacion120(codo)
        ee = rotacion120(ee)

    if (codo[0] - ee[0]) != 0:
        ang_a = math.atan((ee[2] - codo[2]) / (codo[0] - ee[0]))
        if ((codo[0] - ee[0]) < 0):
            ang_a = ang_a + (180 * dtr)
    else:
        print("entra")
        ang_a = 1.570796326794897

    # prep
    codo = rotacion_y(codo, ang_a)
    ee = rotacion_y(ee, ang_a)

    # calc
    if (codo[0] - ee[0]) != 0:
        ang_b = math.atan((ee[1] - 0) / (codo[0] - ee[0]))
        if ((codo[0] - ee[0]) < 0):
            ang_a = ang_a + (180 * dtr)
    else:
        ang_b = 0
    return [ang_a, ang_b]


# |------------------------------------------|
# |-------------- rotacion_y ----------------|
# |------------------------------------------|
def rotacion_y(ent, ang):
    sal = [0.0, 0.0, 0.0]
    sal[0] = ent[0] * math.cos(ang) - ent[2] * math.sin(ang)
    sal[1] = ent[1]
    sal[2] = -ent[0] * math.sin(ang) + ent[2] * math.cos(ang)
    return sal
