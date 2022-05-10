%% det
syms k11 k12 k21 k22 s
Km=[k11 k12;k21 k22];
As=A-B*Km;
Es=[s 0;0 s];
det(Es-As)
-B*inv(Es-As)