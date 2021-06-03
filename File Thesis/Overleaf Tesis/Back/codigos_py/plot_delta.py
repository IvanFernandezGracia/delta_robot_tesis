# Nombre Creador: Ivan Alejandro Fernandez Gracia
# Universidad: Universidad de Santiago de Chile
# Mail: ivan.fernandez.g@usach.cl
# Objetivo: Plotear datos robot delta.

###############################################
####### [Importar Librerias] ##################
###############################################
import math
import numpy as np
from numpy.linalg import inv
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

dtr = math.pi / 180.0  # degrees to radians


###################################
####### [Comparar Torques] ########
###################################
def torque_adams(tiempo,
                 motor1, motor2, motor3,
                 motor11, motor22, motor33,
                 motor111, motor222, motor333,
                 tiempo_adamas):
    fig = plt.figure()
    fig.suptitle(' Torque  Metodo 1 Nmm')

    axx0 = fig.add_subplot(1, 3, 1)
    axx0.plot(tiempo, motor1, 'o', label="Metodo A", markersize=3)
    axx0.plot(tiempo, motor11, 'x', label="Metodo B", markersize=1)
    axx0.plot(tiempo_adamas, motor111, '.', label="ADAMS", markersize=3, alpha=0.3)
    axx0.set_xlabel('[s]')
    axx0.set_ylabel('[N*m]')
    axx0.title.set_text('Torque Actuador 1')
    axx0.legend(loc="2", prop={'size': 8})

    plt.grid(b=True, which='major', color='#666666', linestyle='-', alpha=0.6)
    plt.minorticks_on()
    plt.grid(b=True, which='minor', color='#999999', linestyle='--', alpha=0.2, linewidth=1)

    axx1 = fig.add_subplot(1, 3, 2)
    axx1.plot(tiempo, motor2, 'o', label="Metodo A", markersize=3)
    axx1.plot(tiempo, motor22, 'x', label="Metodo B", markersize=1)
    axx1.plot(tiempo_adamas, motor222, '.', label="ADAMS", markersize=3, alpha=0.3)
    axx1.set_xlabel('[s]')
    axx1.set_ylabel('[N*m]')
    axx1.title.set_text('Torque Actuador 2')
    axx1.legend(loc="2", prop={'size': 8})

    plt.grid(b=True, which='major', color='#666666', linestyle='-', alpha=0.6)
    plt.minorticks_on()
    plt.grid(b=True, which='minor', color='#999999', linestyle='--', alpha=0.2, linewidth=1)

    axx2 = fig.add_subplot(1, 3, 3)
    axx2.plot(tiempo, motor3, 'o', label="Metodo A", markersize=3)
    axx2.plot(tiempo, motor33, 'x', label="Metodo B", markersize=1)
    axx2.plot(tiempo_adamas, motor333, '.', label="ADAMS", markersize=3, alpha=0.3)
    axx2.set_xlabel('[s]')
    axx2.set_ylabel('[N*m]')
    axx2.title.set_text('Torque Actuador 3 ')
    axx2.legend(loc="2", prop={'size': 8})

    plt.grid(b=True, which='major', color='#666666', linestyle='-', alpha=0.6)
    plt.minorticks_on()
    plt.grid(b=True, which='minor', color='#999999', linestyle='--', alpha=0.2, linewidth=1)

    plt.ion()
    plt.show(0)
    plt.pause(10)
    # plt.ioff()
    plt.close('all')
    return


###################################################################
####### [Comparar Posicion, velocidad y aceleracion angular] ######
###################################################################
def comparar_angles(matriz_res):
    tiempo = matriz_res[0]

    th1_pos_A = matriz_res[1]
    th1_vel_A = matriz_res[2]
    th1_acel_A = matriz_res[3]

    th2_pos_A = matriz_res[4]
    th2_vel_A = matriz_res[5]
    th2_acel_A = matriz_res[6]

    th3_pos_A = matriz_res[7]
    th3_vel_A = matriz_res[8]
    th3_acel_A = matriz_res[9]

    th1_pos_B = matriz_res[10]
    th1_vel_B = matriz_res[11]
    th1_acel_B = matriz_res[12]

    th2_pos_B = matriz_res[13]
    th2_vel_B = matriz_res[14]
    th2_acel_B = matriz_res[15]

    th3_pos_B = matriz_res[16]
    th3_vel_B = matriz_res[17]
    th3_acel_B = matriz_res[18]

    fig = plt.figure()
    fig.suptitle('Posicion, velocidad y aceleracion angular metodo A y B')

    axx0 = fig.add_subplot(3, 3, 1)
    axx0.plot(tiempo, th1_pos_A, '.r', markersize=1)
    axx0.plot(tiempo, th1_pos_B, 'ob', markersize=1, alpha=0.3)
    axx0.set_xlabel('[t]')
    axx0.set_ylabel('th1 [deg] ')
    axx0.title.set_text('th1')
    plt.grid(True)

    axx1 = fig.add_subplot(3, 3, 2)
    axx1.plot(tiempo, th1_vel_A, '.r', markersize=1)
    axx1.plot(tiempo, th1_vel_B, 'ob', markersize=1, alpha=0.3)
    axx1.set_xlabel('[t]')
    axx1.set_ylabel('th1_p [deg/s] ')
    axx1.title.set_text('th1_P')
    plt.grid(True)

    axx2 = fig.add_subplot(3, 3, 3)
    axx2.plot(tiempo, th1_acel_A, '.r', markersize=1)
    axx2.plot(tiempo, th1_acel_B, 'ob', markersize=1, alpha=0.3)
    axx2.set_xlabel('[t]')
    axx2.set_ylabel('th1_pp [deg/s2] ')
    axx2.title.set_text('th1_pp')
    plt.grid(True)

    ay0 = fig.add_subplot(3, 3, 4)
    ay0.plot(tiempo, th2_pos_A, '.r', markersize=1)
    ay0.plot(tiempo, th2_pos_B, 'ob', markersize=1, alpha=0.3)
    ay0.set_xlabel('[t]')
    ay0.set_ylabel('th2 [deg] ')
    ay0.title.set_text('th2')

    az1 = fig.add_subplot(3, 3, 5)
    az1.plot(tiempo, th2_vel_A, '.r', markersize=1)
    az1.plot(tiempo, th2_vel_B, 'ob', markersize=1, alpha=0.3)
    az1.set_xlabel('[t]')
    az1.set_ylabel('th2_p [deg/s] ')
    az1.title.set_text('th2_p')
    plt.grid(True)

    az2 = fig.add_subplot(3, 3, 6)
    az2.plot(tiempo, th2_acel_A, '.r', markersize=1)
    az2.plot(tiempo, th2_acel_B, 'ob', markersize=1, alpha=0.3)
    az2.set_xlabel('[t]')
    az2.set_ylabel('th2_pp [deg/s2] ')
    az2.title.set_text('th2_pp')
    plt.grid(True)

    ay0 = fig.add_subplot(3, 3, 7)
    ay0.plot(tiempo, th3_pos_A, '.r', markersize=1)
    ay0.plot(tiempo, th3_pos_B, 'ob', markersize=1, alpha=0.3)
    ay0.set_xlabel('[t]')
    ay0.set_ylabel('th3 [deg] ')
    ay0.title.set_text('th3')
    plt.grid(True)

    az1 = fig.add_subplot(3, 3, 8)
    az1.plot(tiempo, th3_vel_A, '.r', markersize=1)
    az1.plot(tiempo, th3_vel_B, 'ob', markersize=1, alpha=0.3)
    az1.set_xlabel('[t]')
    az1.set_ylabel('th3_p [deg/s] ')
    az1.title.set_text('th3_p')
    plt.grid(True)

    az2 = fig.add_subplot(3, 3, 9)
    az2.plot(tiempo, th3_acel_A, '.r', markersize=1)
    az2.plot(tiempo, th3_acel_B, 'ob', markersize=1, alpha=0.3)
    az2.set_xlabel('[t]')
    az2.set_ylabel('th3_pp [deg/s2] ')
    az2.title.set_text('th3_pp')

    plt.grid(True)
    plt.ion()
    plt.show(0)
    plt.pause(4)
    plt.ioff()


###################################
####### [Espacio de Trabajo] ######
###################################
def graphws(file_ws, file_ws_sing, file_ws_sing_inv, file_ws_real):
    x = file_ws[0:, 0]
    y = file_ws[0:, 1]
    z = file_ws[0:, 2]

    xs = file_ws_sing[0:, 0]
    ys = file_ws_sing[0:, 1]
    zs = file_ws_sing[0:, 2]

    xss = file_ws_sing_inv[0:, 0]
    yss = file_ws_sing_inv[0:, 1]
    zss = file_ws_sing_inv[0:, 2]

    xsss = file_ws_real[0:, 0]
    ysss = file_ws_real[0:, 1]
    zsss = file_ws_real[0:, 2]

    fig = plt.figure()
    fig.suptitle('Workspace Robot Delta')

    ax = fig.add_subplot(2, 3, 1, projection='3d')
    my_cmap = plt.get_cmap('hsv')
    plotws = ax.scatter(x, y, z, alpha=0.8, c=z, cmap=my_cmap, marker='.', s=0.5)
    # ax.scatter(xsss, ysss, zsss, s=1 ,c='r',marker='.')
    ax.set_xlabel('X [mm]')
    ax.set_ylabel('Y [mm]')
    ax.set_zlabel('Z [mm]')
    ax.title.set_text('Puntos Alcanzables')
    fig.colorbar(plotws, ax=ax, shrink=0.5, aspect=5)

    # Vista superior XY
    ay1 = fig.add_subplot(2, 3, 2)
    ay1.plot(x, y, '.', markersize=0.5)
    ay1.plot(xsss, ysss, '.r', markersize=1)
    ay1.set_xlabel('X [mm]')
    ay1.set_ylabel('Y [mm]')
    ay1.title.set_text('Superior XY')

    # Vista frontal Xz
    ay2 = fig.add_subplot(2, 3, 3)
    ay2.plot(x, z, '.', markersize=0.5)
    ay2.plot(xsss, zsss, '.r', markersize=1)
    ay2.set_xlabel('X [mm]')
    ay2.set_ylabel('Z [mm]')
    ay2.title.set_text('Frontal XZ')

    # Puntos en 3D Singulares jxx
    axs = fig.add_subplot(2, 3, 4, projection='3d')
    axs.scatter(xs, ys, zs, s=1, c='g', marker='.')
    axs.scatter(x, y, z, alpha=0.2, s=0.5, c='b', marker='.')
    axs.set_xlabel('X [mm]')
    axs.set_ylabel('Y [mm]')
    axs.set_zlabel('Z [mm]')
    axs.title.set_text('Det jxx = 0')

    # Puntos en 3D Singulares INV
    axss = fig.add_subplot(2, 3, 5, projection='3d')
    axss.scatter(xss, yss, zss, s=1, c='g', marker='.')
    axss.scatter(x, y, z, alpha=0.1, s=0.5, c='b', marker='.')
    axss.set_xlabel('X [mm]')
    axss.set_ylabel('Y [mm]')
    axss.set_zlabel('Z [mm]')
    axss.title.set_text('Det inv = 0')

    # Puntos en 3D acotados a la aplicacion (area rectangular)
    axsss = fig.add_subplot(2, 3, 6, projection='3d')
    axsss.scatter(xsss, ysss, zsss, s=1, c='r', marker='.')
    axsss.set_xlabel('X [mm]')
    axsss.set_ylabel('Y [mm]')
    axsss.set_zlabel('Z [mm]')
    axsss.title.set_text('WS REAL')

    plt.show()
