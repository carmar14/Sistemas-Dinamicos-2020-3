clc
clear
close all

global m1 m2 g L k b F
F=10;
m1=20;
m2=10;
g=9.8;
L=0.2;
k=100;
b=13;

t=0:4e-2:20;
x0=[0 0 0 0]; 
[t,y]=ode45(@grua,t,x0);

[m n]=size(y);
%animacion
figure
x=y(:,1);
x2=x+L*sin(y(:,3));
y2=-L*cos(y(:,3));
for i=1:m
    x_m1=[0 x(i)];
    y_m1=[0 0];
    x_m2=[x(i) x2(i)];
    y_m2=[0 y2(i)];
    long(i)=sqrt((x(i)-x2(i))^2+y2(i)^2);
    plot(x_m1,y_m1,'-','MarkerEdge',[0.9,0,0.8],'MarkerSize',10) % Movimiento de la grua
    hold on
    plot(x_m2,y_m2,'k')%Cuerda
    plot(x2(1:i),y2(1:i),'.r') % trayectoria de la masa m2
    plot(x_m1(2),y_m1(2),'s','MarkerEdge',[0,102/255,0],'MarkerFace',[0,102/255,0],'MarkerSize',10) % cabezal de la grua
    plot(x_m2(2),y_m2(2),'.b','MarkerSize',30) % masa m2
    hold off
%     ylim([min(y2) 0])
%     
    xlim([min(x2) max(x2)])
    ylim([min(y2) 0])

    pause(0.001)
end


figure
for i=1:n
    subplot(n,1,i)
    
    plot(t,y(:,i))
end


function [dxdt]=grua(t,X)
    global m1 m2 g L k b F
    
    %X(1)=x X(2)=xp X(3)=theta X(4)=thetap
    x1p=X(2);
    x3p=X(4);
    x2p=(F-k*X(1)-b*X(2)+g*m2)/m1;
    x4p=(-g*X(3)-x2p)/L;
    dxdt=[x1p;x2p;x3p;x4p];

end


