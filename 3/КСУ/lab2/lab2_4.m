clear, clc
syms b 
A=[-2 b;-b -2];
B=[2 0;0 2];
 
b=0.4;
Xmin1=[1.9; 1.9];
subs(-inv(B)*A)
u=subs(-inv(B)*A*Xmin1)