clear, clc
syms b s a1 a2 t 
A=[-2 b;-b -2];
Es=[s 0;0 s];
B=[2 0;0 2];
Es-A
disp('inv(Es-A)*B')
inv(Es-A)*B