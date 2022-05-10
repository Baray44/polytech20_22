syms s k11 k12 k21 k22
Km=[k11 k12;k21 k22];
As=A-B*Km
%As=[-2-2*k11 9-k12; -9-4*k21 -3-4*k22]
Es=[s 0;0 s];
polin=det(Es-As)
%k11=K(1,1); k12=K(1,2); k21=K(2,1); k11=K(1,1);
-B*inv(Es-As)
