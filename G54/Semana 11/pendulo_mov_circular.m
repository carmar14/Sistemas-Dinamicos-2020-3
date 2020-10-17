clc
clear
close all

global m l w g a
l=0.02;
m=20;
w=5;
g=9.8;
a=0.01;

t=0:4e-3:10;
x0=[0 0]; 
[t,y]=ode45(@pendulo_mov_c,t,x0);

[m1 n]=size(y);
%animacion
figure
theta=y(:,1);
xpos=a*cos(w*t)+l*sin(theta);
ypos=a*sin(w*t)-l*cos(theta);
for i=1:m1
    x_b=[a*cos(w*t(i)) xpos(i)];
    y_b=[a*sin(w*t(i)) ypos(i)];
    plot(a*cos(w*t(1:i)),a*sin(w*t(1:i)),'o','MarkerEdge',[0,102/255,0],'MarkerFace',[0,102/255,0],'MarkerSize',2) % Movimiento circular
    hold on
    plot(x_b,y_b,'r')%Cuerda
    plot(xpos(1:i),ypos(1:i),'.b') % trayectoria de la masa
    plot(x_b(2),y_b(2),'.b','MarkerSize',30) % masa
    hold off
    if min(xpos)>-a
        if max(xpos)>a
            xlim([-a max(xpos)])
        else
            xlim([-a a])
        end
    else
        if max(xpos)>a
            xlim([min(xpos) max(xpos)])
        else
            xlim([min(xpos) a])
        end
        
    end
    
    if min(ypos)>-a
        if max(ypos)>a
            ylim([-a max(ypos)])
        else
            ylim([-a a])
        end
    else
        if max(ypos)>a
            ylim([min(ypos) max(ypos)])
        else
            ylim([min(ypos) a])
        end
        
    end
    %xlim([min(xpos) max(xpos)])
    %ylim([min(ypos) max(ypos)])

    pause(0.01)
end


figure
for i=1:n
    subplot(n,1,i)
    
    plot(t,y(:,i))
end


function [dxdt]=pendulo_mov_c(t,X)
    global m l w g a
    %X(1)=theta X(2)=thetap
    x1p=X(2);
    x2p=-(g/l)*sin(X(1))+(a*w^2/l)*cos(X(1)-w*t);
    
    dxdt=[x1p;x2p];

end


