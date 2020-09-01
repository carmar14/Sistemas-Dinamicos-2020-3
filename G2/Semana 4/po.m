clc
clear
close all


%------------Sistemas de primer orden----------

k=3;
tao=4;
h=tf(k,[tao 1]);

k1=1/2;
tao=4;
h2=tf(k1,[tao 1]);

h3=tf(k,[tao/2 1]);
h4=tf(k,[tao*2 1]);

h5=tf(-k,[tao 1]);

step(h*2);
hold on
step(h2*2);
hold on
step(h3*2);
hold on
step(h4*2);
hold on
step(h5*2);
legend('h','h2','h3','h4','h5')
figure
pzmap(h,h2,h3,h4,h5)
legend('h','h2','h3','h4','h5')
