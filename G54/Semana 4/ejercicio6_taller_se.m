clc 
clear 
close all
%Solución ejercicio 6 del taller de sistemas electricos
R1=10e3;
R2=5e3;
C1=1e-6;
C2=10e-6;
%--------------------Vc2(s)/V(s)---------------------
h=tf(1,[R1*R2*C1*C2 R1*(C1+C2)+R2*C2 1]);
figure
pzmap(h);
figure
step(h,'b')

%----------------VE-----------
A=[-(1/C1)*(1/R1+1/R2) 1/(R2*C1); 1/(R2*C2) -1/(R2*C2)];
B=[1/(R1*C1) 0]';
C=[0 1];
D=[];
sis=ss(A,B,C,D);
hold on
step(sis,'--r')

legend('ft','ve')