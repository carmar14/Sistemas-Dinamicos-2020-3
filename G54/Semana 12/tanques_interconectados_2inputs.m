clear
close all
clc

%Parametros del tanque
R1=10;
R2=28;
C1=60;
C2=60;

A=[-1/(R1*C1) 1/(R1*C1)
    1/(R1*C2) -1/C2*(1/R2+1/R1)];
B=[1/C1 0; 0 1/C2]';
C=[1 0;
   0 1];
D=zeros(2,2);
sis3=ss(A,B,C,D);
[b,a] = ss2tf(A,B(:,1),C,D(:,1));
[b1,a1] = ss2tf(A,B(:,2),C,D(:,2));

[y t]=step(sis3);
step(sis3);

figure
plot(t,y(:,1,1)+y(:,1,2))
ylabel('h1(m)');
xlabel('Tiempo (s)');
title('Nivel de altura del líquido almacenado en el tanque 1')
figure
plot(t,y(:,2,1)+y(:,2,2))
ylabel('h2(m)');
xlabel('Tiempo (s)');
title('Nivel de altura del líquido almacenado en el tanque 2')

