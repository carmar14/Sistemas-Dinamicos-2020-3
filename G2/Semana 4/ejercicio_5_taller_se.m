clc 
clear 
close all
%Solución ejercicio 5 del taller de sistemas electricos
R=10e3;
L=500e-3;
C1=1e-6;
C2=10e-6;
%--------------------Vc2(s)/V(s)---------------------
h=tf(1,[L*R*C1*C2 L*(C1+C2) R*C2 1]);
figure
pzmap(h);
figure
step(h,'b')

%----------------VE-----------
A=[0 -1/L 0; 1/C1 -1/(R*C1) 1/(R*C1); 0 1/(R*C2) -1/(R*C2)];
B=[1/L 0 0]';
C=[0 0 1];
D=[];
sis=ss(A,B,C,D);
hold on
step(sis,'--r')

legend('ft','ve')