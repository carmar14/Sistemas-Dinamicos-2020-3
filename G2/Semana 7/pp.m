clear 
close all
clc

%Parametros sistema mecanico
m2=10;
m1=45;
k1=10;
k2=20;
k3=45;
b=23;

Am=[0 1 0 0;
    -(k1+k2)/m1 -b/m1 k2/m1 b/m1;
    0 0 0 1;
    k2/m2 b/m2 -(k2+k3)/m2 -b/m2];
Bm=[0 1/m1 0 0]';
Cm=[0 0 1 0];
Dm=0;

sism=ss(Am,Bm,Cm,Dm);
step(sism)

%Paramtros sistema electrico
R1=4500;
R2=10000;
L=10e-3;
C=470e-6;

Ae=[-R1/(L*(1+R1/R2)) R1/(L*R2*(1+R1/R2));
    -R1/(R1+R2) -1/(R1+R2)];
Be=[1/(L*(1+R1/R2)) 1/(1+R1/R2)]';
Ce=[-R1/(1+R1/R2) R1/(R2*(1+R1/R2))];
De=[1/(1+R1/R2)];

sise=ss(Ae,Be,Ce,De);
figure
step(sise)


%sistema tercer punto
k=4.5;
tao=2;
h=tf(k,[tao 1]);
figure
step(2*h)
hr=feedback(h,1);
figure
step(2*hr)
legend('SPO','SPO REALIMENTADO')