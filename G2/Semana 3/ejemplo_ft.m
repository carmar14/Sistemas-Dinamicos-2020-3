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






