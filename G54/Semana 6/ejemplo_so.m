clear 
clc
close all

%Sobreamortiguado
wn=2;
e=4;
k=2;

h=tf(k*wn^2,[1 2*e*wn wn^2]);

step(h)
figure
pzmap(h)
[p z]=pzmap(h);
tao1=-1/p(1);
tao2=-1/p(2);
Ts1=4*(tao1+tao2);



%criticamente amortiguado
wn=7;
e=1;
k=2;

h=tf(k*wn^2,[1 2*e*wn wn^2]);
figure
step(h)
figure
pzmap(h)
[p z]=pzmap(h);
tao1=-1/p(1);
tao2=-1/p(2);
Ts2=4*(tao1+tao2);