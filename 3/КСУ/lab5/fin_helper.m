b=0.4; korni=-12
As=[korni 0; 0 korni];A=[-2 0.4; -0.4 (-2)];B=[2 0;0 2];X0=[1.9;1.9];
V0m=[X0(1) 0; 0 X0(2)];%[1 0; 0 1]%[X0(1) 0; 0 X0(2)]

Kisn=[(-korni/B(1, 1)-1) b/B(1, 1); -b/B(2, 2) (-korni/B(2, 2)-1)]
AsRassch=A-B*Kisn

G=-inv(B)*As*inv(V0m)*X0; %G=(-inv(B)*A+Kisn)*inv(V0m)*X0;
K=-Kisn; g1=G(1), g2=G(2)