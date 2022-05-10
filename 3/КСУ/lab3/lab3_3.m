syms s
K=[5 -0.5; 0.6 5];
As=A-B*K; Es=[s 0;0 s];
det(Es-As) 
disp('-inv(B)*As') %Для выражения U
-inv(B)*As