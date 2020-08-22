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



