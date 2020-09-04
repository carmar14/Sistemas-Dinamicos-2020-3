clc
clear
close all

R1=100e3;
R2=1e3;
R3=10e3;
C1=10e-6;
C2=1e-6;

h=tf(-R3,[R1*R2*R3*C2*C1 C2*(R1*R3+R3*R2+R1*R2) R1]);
h2=tf([1 -10],1);
bode(h)
grid on

figure
pzmap(h)

figure
step(h)

figure
ht=h2*h;
step(ht)