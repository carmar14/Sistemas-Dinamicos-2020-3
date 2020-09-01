clc
clear 
close all

%-----Ejemplo 1 de sistemas electricos------
R=10e3;
C=120e-6;
%--------------------Vr(s)/V(s)-------------
h=tf([R*C 0],[R*C 1]);

%---------------VE-----------
A=-1/(R*C);
B=1/(R*C);
Cs=-1;
D=1;
sis=ss(A,B,Cs,D);

pzmap(sis)
figure
step(h,'b',sis,'*r')
legend('ft','ve')


%-----Ejemplo 2 de sistemas electricos------
R=1e3;
C=12e-6;
L=100e-3;
%--------------------Il(s)/I(s)-------------
h=tf(R,[R*C*L L R]);

%---------------VE-----------
A=[-1/(R*C) -1/C;1/L 0];
B=[1/C 0]';
Cs=[0 1];
D=[];
sis=ss(A,B,Cs,D);

figure
pzmap(sis)
figure
step(h,'b',sis,'*r')
legend('ft','ve')



