clc
clear
close all

%Función de trnasferencia
h=tf(2,[1 4 8]);

%Mapa de polos y ceros
pzmap(h)

[po ze]=pzmap(h);

%otra forma para obtener los p/z
ceros=roots(2);
polos=roots([1 4 8]);

%respuesta al escalon unitario
figure
step(h)


%Ejemplo de DB
h=tf(1,[1 4 19 49 144]);
figure
pzmap(h)
figure
step(h)


%VE
A=[0 1 0 0;
   0 0 1 0;
   0 0 0 1;
   -144 -49 -19 -4];
B=[0 0 0 1]';
C=[1 0 0 0];
D=[];

sis=ss(A,B,C,D);
figure
pzmap(sis)
figure
step(sis,'b')
hold on
step(h,'--r')






