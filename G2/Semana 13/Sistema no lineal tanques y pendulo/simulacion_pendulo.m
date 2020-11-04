clc
clear
close all

global Xe
Xe=[0 0];
Xini=[1 0];%0.9*Xe; %Condiciones iniciales del no lineal
Xinil=Xini-Xe; %Condiciones iniciales del lineal
t=linspace(0,4,100);
[t,y]=ode45(@pendulo_simple,t,Xini);
[m n]=size(y);
[t,y1]=ode45(@pendulo_simple_lineal,t,Xinil);

for i=1:n
subplot(n,1,i)
plot(t,y(:,i),t,y1(:,i)+Xe(1,i))
end

function dXdt=pendulo_simple_lineal(t,X)  %  
    global Xe
    %Parametros del sistema
    m=5;
    g=9.8;
    l=1;
    x1e=Xe(1,1);%0.01;
      
    %x1=X(1), x2=X(2)
    
    dXdt=[X(2);(-g/l)*cos(x1e)*X(1)];
%     dXdt=[X(2);(f-k*X(1)-c*X(2))/m];

end