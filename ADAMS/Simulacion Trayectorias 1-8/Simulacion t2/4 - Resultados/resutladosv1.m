clear all
clc
clf 

filename1 = 'trayectoriaTiempo.txt';
A1 = importdata(filename1);
timeros=A1;

%%%%%%%%%%%%%%%%%%%%%%%555

filename2 = 'Torque1.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A2 = importdata(filename2,delimiterIn,headerlinesIn);

figure(1)
plot (timeros(1:(end-1),1),-A2.data,'xr')
grid on
hold on

filename3 = 'Torque2.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A3 = importdata(filename3,delimiterIn,headerlinesIn);

figure(1)
plot (timeros(1:(end-1),1),-A3.data,'xg')
grid on
hold on

filename4 = 'Torque3.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A4 = importdata(filename4,delimiterIn,headerlinesIn);

figure(1)
plot (timeros(1:(end-1),1),-A4.data,'xb')
grid on
hold on

%%%%%%%%%%%%%%%%%5

filename1 = 'asdasd.txt';
A1 = importdata(filename1);
timeadams=A1.data(:,1);

figure(1)
plot (timeadams,A1.data(:,2)*0.001,'-r')
grid on
hold on

figure(1)
plot (timeadams,A1.data(:,3)*0.001,'-g')
grid on
hold on

figure(1)
plot (timeadams,A1.data(:,4)*0.001,'-b')
grid on
hold on

title('Torque vs Tiempo Motores')
xlabel('segundos')
ylabel('Torque [Newton Metro]')

legend('ROS M1','ROS M2','ROS M3','ADAMS M2','ADAMS M3','ADAMS M1')

