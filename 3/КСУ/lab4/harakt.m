clear, clc
A=[-2 0.4;-0.4 -2];
B=[2 0;0 2];
%syms k11   k22 s
syms s%
kf=1;%
Kisn=[(95-kf*sqrt(759))/20 0; 0 (95+kf*sqrt(759))/20]%
k11=Kisn(1), k22=Kisn(2)%
k12=0; k21=0;
K=[k11 0; 0 k22]
As=A-B*K
Es=[s 0;0 s]
det(Es-As)
sol=solve(det(Es-As), s)
%image()
