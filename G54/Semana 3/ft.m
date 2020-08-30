clear
close all
clc


%Funcion de transferencia
gato=tf(5,[3 0 5]);

%Polos y ceros con el mapa
pzmap(gato)
[polo zero]=pzmap(gato);

%Raices de polinomios
r=roots([3 0 5]);
n=roots([5]);

%Respuesta
figure
step(gato)
xlim([0 10])


%------variables de estado------
A=[0 1; -5/3 0];
B=[0 5/3]';
C=[1 0];
D=[];

sis=ss(A,B,C,D);
figure
pzmap(sis);
figure
step(sis);
xlim([0 10])
