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
Ts1=4*(tao1+tao2)



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
Ts2=4*(tao1+tao2)




%subatmortiguado
wn=7;
e=0.5;
k=2;

h=tf(k*wn^2,[1 2*e*wn wn^2]);
figure
step(h)
figure
pzmap(h)
[p z]=pzmap(h);
tao1=-1/real(p(1));
% tao2=-1/p(2);
Ts3=4/(e*wn)
Ts4=4*tao1

k=-2;wn=7.1608;e=0.49;

h2=tf(k*wn^2,[1 2*e*wn wn^2]);
[p z]=pzmap(h2);
tao=1/(100*(e*wn));
h7=h2*tf(1,[tao 1])*tf(1,[2*tao 1])*tf(1,[1.2*tao 1])*tf(1,[2.5*tao 1])*tf(1,[2.5*tao 1]);



figure
hold on

step(-1*h2,'k')
step(-1*h7,'r')
step(h,'b')

hsensor=tf(1,[1/3.6 1]);

hs=h*hsensor;
figure
step(h)
hold on
step(hs)


%sistemas de orden superior
h1=tf(1,[1 1]);
h2=tf(1,[3 1]);
h3=tf(1,[4.5 1]);
Ts=4*(1+3+4.5)
ht=h1*h2*h3;
figure
step(ht)
