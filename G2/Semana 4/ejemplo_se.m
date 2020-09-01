clc
clear 
close all

%-----Ejemplo 1 de sistemas electricos------
R=10e3;
C=120e-6;
%--------------------Vc(s)/V(s)-------------
h=tf(1,[R*C 1]);

%---------------VE-----------
A=-1/(R*C);
B=1/(R*C);
Cs=1;
D=0;
sis=ss(A,B,Cs,D);

pzmap(sis)
figure
step(h,'b',sis,'*r')
legend('ft','ve')


%-----Ejemplo 2 de sistemas electricos------
R=1e3;
C=12e-6;
L=100e-3;
%--------------------Vc(s)/I(s)-------------
h=tf([R*L 0],[R*C*L L R]);

%---------------VE-----------
A=[-1/(R*C) -1/C;1/L 0];
B=[1/C 0]';
Cs=[1 0];
D=[];
sis=ss(A,B,Cs,D);

figure
pzmap(sis)
figure
step(h,'b',sis,'*r')
legend('ft','ve')



