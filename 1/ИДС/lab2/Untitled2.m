NFACTORS = 5;
[S, X] = cordexch(NFACTORS, NRUNS, 'linear');
Slin = S;
x1=[1 2];
x2=[2 3];
x3=[3 4];
x4=[4 5];
x5=[5 6];
X=[(x1(1)+x1(2))/2 (x1(2)-x1(1))/2;
(x2(2)+x2(1))/2 (x2(2)-x2(1))/2;
(x3(2)+x3(1))/2 (x3(2)-x3(1))/2;
(x4(2)+x4(1))/2 (x4(2)-x4(1))/2;
(x5(2)+x5(1))/2 (x5(2)-x5(1))/2];
NRUNS = 6;
S = Slin;
for i=1:NRUNS
for j=1:NFACTORS
XRES(i,j)=X(j,1)+X(j,2)*S(i,j);
XRES(i,j)=XRES(i,j)*(1 + 0.05*rand(1,1)*sign(randn(1)));
end
end
Y=(3*(XRES(:,1).*XRES(:,2))+XRES(:,2).*XRES(:,4).*XRES(:,5)+XRES(:,1).*XRES(:,3).*XRES(:,5));
rstool(XRES,Y,'linear')
echo off  pause
beta_linear = beta;
NRUNS = 16;
S = Sint;
for i=1:NRUNS
for j=1:NFACTORS
XRES(i,j)=X(j,1)+X(j,2)*S1(i,j);
XRES(i,j)=XRES(i,j)*(1 + 0.05*rand(1,1)*sign(randn(1)));
end
end
Y=(3*(XResult(:,1).*XRES(:,2))+XRES(:,2).*XRES(:,4).*XRES(:,5)+XRES(:,1).*XRES(:,3).*XRES(:,5));
rstool(XRES,Y,'interaction')
echo off  pause
beta_interaction = beta1;
NRUNS = 21;
S2 = Squad;
for i=1:NRUNS
for j=1:NFACTORS
XRES(i,j)=X(j,1)+X(j,2)*S2(i,j);
XRES(i,j)=XRES(i,j)*(1 + 0.05*rand(1,1)*sign(randn(1)));
end
end
Y=(3*(XRES(:,1).*XRES(:,2))+XRES(:,2).*XRES(:,4).*XRES(:,5)+XRES(:,1).*XRES(:,3).*XRES(:,5));
rstool(XRES,Y,'quadratic')
echo off  pause
beta_quadratic = beta2;
NRUNS = 11;
S = Spure;
for i=1:NRUNS
for j=1:NFACTORS
XRES(i,j)=X(j,1)+X(j,2)*S3(i,j);
XRES(i,j)=XRES(i,j)*(1 + 0.05*rand(1,1)*sign(randn(1)));
end
end
Y=(3*(XRES(:,1).*XRES(:,2))+XRES(:,2).*XRES(:,4).*XRES(:,5)+XRES(:,1).*XRES(:,3).*XRES(:,5));
rstool(XRES,Y,'purequadratic')
echo off  pause
beta_purequadratic = beta3;