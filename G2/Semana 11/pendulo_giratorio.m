clc
clear
close all

global m l w g
l=0.1;
m=20;
w=11;
g=9.8;


t=0:4e-3:10;
x0=[0.1 0]; 
[t,y]=ode45(@pendulo_sop_g,t,x0);

[m1 n]=size(y);
%animacion
figure
xpos=l*sin(y(:,1)).*cos(w*t);
ypos=l*sin(y(:,1)).*sin(w*t);
zpos=-l*cos(y(:,1));
for i=1:m1
    x_b=[0 xpos(i)];
    y_b=[0 ypos(i)];
    z_b=[0 zpos(i)];
    plot3(x_b,y_b,z_b,'r')%Cuerda
    hold on
    plot3(xpos(1:i),ypos(1:i),zpos(1:i),'.b') % trayectoria de la masa
    plot3(x_b(2),y_b(2),z_b(2),'.b','MarkerSize',30) % masa
    hold off
    if min(xpos)>-l
        if max(xpos)>l
            xlim([min(xpos) l])
        else
            xlim([min(xpos) max(xpos)])
        end
    else
        if max(xpos)>l
            xlim([-l l])
        else
            xlim([-l max(xpos)])
        end
        
    end
    
    if min(ypos)>-l
        if max(ypos)>l
            ylim([min(ypos) l])
        else
            ylim([min(ypos) max(ypos)])
        end
    else
        if max(ypos)>l
            ylim([-l l])
        else
            ylim([-l max(ypos)])
        end
        
    end
    
    if min(zpos)>-l
        if max(zpos)>l
            zlim([min(zpos) l])
        else
            if max(zpos)>0
                zlim([min(zpos) max(zpos)])
            else
                zlim([min(zpos) 0])
            end
        end
    else
        if max(zpos)>l
            zlim([min(zpos) max(zpos)])
        else
            zlim([min(zpos) l])
        end
        
    end
%     xlim([min(xpos) max(xpos)])
%     ylim([min(ypos) max(ypos)])
%     zlim([min(zpos) 0])
    pause(0.001)
end

[X,Y,Z] = sphere;
X2 = X*l;
Y2 = Y*l;
Z2 = Z*l;
hold on
s=surf(X2,Y2,Z2,'FaceAlpha',0.2);
s.EdgeColor = 'none';

figure
for i=1:n
    subplot(n,1,i)
    
    plot(t,y(:,i))
end


function [dxdt]=pendulo_sop_g(t,X)
    global m l w g
    %X(1)=theta X(2)=thetap
    x1p=X(2);
    x2p=-g/l*sin(X(1))+w^2*cos(X(1))*sin(X(1));
    
    dxdt=[x1p;x2p];

end


