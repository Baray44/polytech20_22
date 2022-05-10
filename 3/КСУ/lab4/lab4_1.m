clear, clc
b=0.4; A=[-2 b;-b -2]; B=[2 0;0 2];
X0=[1.9;1.9];
V0m=[X0(1) 0; 0 X0(2)]; kf=-1;
Kisn=[(95-kf*sqrt(759))/20 0; 0 (95+kf*sqrt(759))/20]
As=A-B*Kisn
G=(-inv(B)*A+Kisn)*inv(V0m)*X0;
K=-Kisn;
g1=G(1), g2=G(2)