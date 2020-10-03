clc
clear
close all

%parametros
r1=0.01;
r2=0.05;
K1=100;
K2=120;
B1=450;
B2=200;
J1=0.1;
J2=0.5;

A=[0 1;
  -(K2+K1*(r2/r1)^2)/(J2+J1*(r2/r1)^2) -(B2+B1*(r2/r1)^2)/(J2+J1*(r2/r1)^2)];
B=[0 0;
   (r2/r1)/(J2+J1*(r2/r1)^2) 1/(J2+J1*(r2/r1)^2)];
C=[1 0];
D=zeros(1,2);
sis=ss(A,B,C,D);
step(sis)

%magnitud de entradas
u1=10;
u2=50;

%g54
A54=[0 1;
  -(K1+K2*(r1/r2)^2)/(J1+J2*(r1/r2)^2) -(B1+B2*(r1/r2)^2)/(J1+J2*(r1/r2)^2)];
B54=[0 0;
   1/(J1+J2*(r1/r2)^2) (r1/r2)/(J1+J2*(r1/r2)^2)];
C54=[r1/r2 0];
D54=zeros(1,2);
sis54=ss(A54,B54,C54,D54);
hold on
step(sis54,'*r')
