clc
clear
close all
%------------------------------Grupo 2----------------------------
%---------------------------Primer punto--------------------------
%------------Ecuaciones-------------
%a) Cambio qp=i  y qpp=ip
%v=R*i+L*ip+Ke*x1p
%M1*x1pp=Km*i-k1*x1-b1(x1p-x2p)
%M2*x2pp=F-k2*x2-b1(x2p-x1p)-b2*x2p

%b)Parametros
R=1e3; %ohmio
L=1e-3; %Henry
Ke=3; %Vs/m
Km=3; %N/A
k1=1000; %N/m
k2=2000; %N/m
b1=300; %Ns/m
b2=200; %Ns/m
M1=5; %Kg
M2=10; %Kg

%c)vector de estados --> X=[i x1 x1p x2 x2p]'
%vector de entradas  --> U=[v F]'
%Vector de salida    --> Y=x1p

A2=[-R/L 0 -Ke/L 0 0;
    0  0 1 0 0;
    Km/M1 -k1/M1 -b1/M1 0 b1/M1;
    0 0 0 0 1;
    0 0 b1/M2 -k2/M2 -(b1+b2)/M2];
B2=[3/L 0 0 0 0;
    0 0 0 0 10/M2]'; % ingreso la magnitud de las entradas para mayor facilidad
C2=[0 0 1 0 0];
D2=[];
sis2=ss(A2,B2,C2,D2);
[y t]=step(sis2); % el vector y contiene las salidas, una para cada entrada

plot(t,y(:,:,1)+y(:,:,2)) %principio de superposición
grid on
xlabel('Tiempo(s)')
ylabel('x1p (m/s)');
title('Velocidad de la masa M1')
xlim([t(1) t(end)])

%--------------------------------Segundo punto---------------------
%H(s)=8/(59s^2+13s+12)
%------------Ecuaciones-------------
%a) 

%J1*theta1pp=T-T1, J1: momento de inercia del eje de 3kg*m^2
%0=T2-D2*theta2p-T3 %torques sobre el eje que contiene los engranajes N2 y N3
% theta2=theta3, theta2p=theta3p,theta2pp=theta3pp
%J*theta4pp=T4-b1*theta4p-F*R,  b1=Amortiguador rotacional en el piñon
%ubicado con la cremallera, J: momento de inercia de este piñón, R: radio
%del piñon
%M*xpp=F-b*xp-k*x; M: masa de 2kg, b: amortiguador lineal, k: constante de
%elasticidad del resorte lineal
%theta4*R=x  theta4p*R=xp  theta4pp*R=xpp
%theta1/theta2=theta1p/theta2p=theta1pp/theta2pp=N2/N1=T2/T1
%theta3/theta4=theta3p/theta4p=theta3pp/theta4pp=N4/N3=T4/T3

%b y c) Uso el comando sim que permite simular un archivo en simulink desde
%matlab
T=-12;
% Parametros
J1=3;
N1=10;
N2=20;
N3=30;
N4=60;
J=3;
R=2;
b1=1;
b=2;
k=3;
M=2;
D2=1;


[t x y]=sim('dbg2.slx'); % t:tiempo x:estados y: salidas
figure
plot(t,y)
grid on
xlabel('Tiempo(s)')
ylabel('x (m)')
title('Desplazamiento vertical de la masa')

%------------------------------Tercer punto-----------------

Ka=4;
h=tf(5*Ka,[1 20 5*Ka]);
figure
step(h)


%----------------------------Grupo 54---------------------------------

%--------------------------------Primer punto-------------------------
%------------Ecuaciones-------------
%a) Cambio qp=i  y qpp=ip
%v=R*i+L*ip+Ke*x1p
%M1*x1pp=Km*i-k1*x1-b1(x1p-x2p)
%M2*x2pp=F-k2*x2-b1(x2p-x1p)-b2*x2p

%b)Parametros
R=1e3; %ohmio
L=1e-3; %Henry
Ke=3; %Vs/m
Km=3; %N/A
k1=1000; %N/m
k2=2000; %N/m
b1=300; %Ns/m
b2=200; %Ns/m
M1=5; %Kg
M2=10; %Kg

%c)vector de estados --> X=[i x1 x1p x2 x2p]'
%vector de entradas  --> U=[v F]'
%Vector de salida    --> Y=x1p

A2=[-R/L 0 -Ke/L 0 0;
    0  0 1 0 0;
    Km/M1 -k1/M1 -b1/M1 0 b1/M1;
    0 0 0 0 1;
    0 0 b1/M2 -k2/M2 -(b1+b2)/M2];
B2=[-10/L 0 0 0 0;
    0 0 0 0 2.5/M2]'; % ingreso la magnitud de las entradas para mayor facilidad
C2=[0 0 1 0 0];
D2=[];
sis2=ss(A2,B2,C2,D2);
figure
[y t]=step(sis2); % el vector y contiene las salidas, una para cada entrada

plot(t,y(:,:,1)+y(:,:,2)) %principio de superposición
grid on
xlabel('Tiempo(s)')
ylabel('x1p (m/s)');
title('Velocidad de la masa M1')
xlim([t(1) t(end)])

%-------------------------------Segundo punto-------------------------

%------------Ecuaciones-------------
%a) 
%J1*theta1pp=T-T1, J1: momento de inercia del eje de 3kg*m^2
%0=T2-D2*theta2p-T3 %torques sobre el eje que contiene los engranajes N2 y N3
% theta2=theta3, theta2p=theta3p,theta2pp=theta3pp
%J*theta4pp=T4-b1*theta4p-F*R,  b1=Amortiguador rotacional en el piñon
%ubicado con la cremallera, J: momento de inercia de este piñón, R: radio
%del piñon
%M*xpp=F-b*xp-k*x; M: masa de 2kg, b: amortiguador lineal, k: constante de
%elasticidad del resorte lineal
%theta4*R=x  theta4p*R=xp  theta4pp*R=xpp
%theta1/theta2=theta1p/theta2p=theta1pp/theta2pp=N2/N1=T2/T1
%theta3/theta4=theta3p/theta4p=theta3pp/theta4pp=N4/N3=T4/T3

%b y c) Uso el comando sim que permite simular un archivo en simulink desde
%matlab
T=2;
% Parametros
J1=3;
N1=10;
N2=20;
N3=30;
N4=60;
J=3;
R=2;
b1=1;
b=2;
k=3;
M=2;
D2=1;


[t x y]=sim('dbg54.slx'); % t:tiempo x:estados y: salidas
figure
plot(t,y)
grid on
xlabel('Tiempo(s)')
ylabel('xp (m/s)')
title('Velocidad vertical de la masa')

%---------------------------Tercer punto----------------------

Ka=60;
h=tf(5*Ka,[1 20 5*Ka]);
figure
step(h)