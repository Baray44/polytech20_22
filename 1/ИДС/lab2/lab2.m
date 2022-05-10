clc, clear, echo off

% 3_2

NFACTORS = 5;

NRUNS = 6;
[S,X] = cordexch(NFACTORS,NRUNS,'linear');
S_linear = S;
X_linear = X;

NRUNS = 16;
[S,X] = cordexch(NFACTORS,NRUNS,'interaction');
S_interaction = S;
X_interaction = X;

NRUNS = 21;
[S,X] = cordexch(NFACTORS,NRUNS,'quadratic');
S_quadratic = S;
X_quadratic =X;

NRUNS = 11;
[S,X] = cordexch(NFACTORS,NRUNS,'purequadratic');
S_purequadratic = S;
X_purequadratic = X;


display(S_linear);
display(S_interaction);
display(S_quadratic);
display(S_purequadratic)

% 3_3.m      

NFACTORS = 5;

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
S = S_linear;
for i=1:NRUNS
    for j=1:NFACTORS
        XRES(i,j)=X(j,1)+X(j,2)*S(i,j);
        XRES(i,j)=XRES(i,j)*(1 + 0.07*rand(1,1)*sign(randn(1)));
    end
end
%Y= ((XRES(:,4).^3).*XRES(:,5))+((XRES(:,1).^2).*XRES(:,2).*XRES(:,5))+(XRES(:,4).^2);

%Y = (XRES(:,2)+XRES(:,2)+XRES(:,2)+XRES(:,2))+(XRES(:,1).^(XRES(:,3)))+(XRES(:,1).*XRES(:,4).*XRES(:,5))

Y = ((XRES(:,1).^(XRES(:,3))).*XRES(:,5))+ XRES(:,2) + (XRES(:,4).^(XRES(:,3)))
rstool(XRES,Y,'linear')

pause
beta_linear = beta

NRUNS = 16;
S = S_interaction;
for i=1:NRUNS
    for j=1:NFACTORS
        XRES(i,j)=X(j,1)+X(j,2)*S(i,j);
        XRES(i,j)=XRES(i,j)*(1 + 0.07*rand(1,1)*sign(randn(1)));
    end
end
%Y= ((XRES(:,4).^3).*XRES(:,5))+((XRES(:,1).^2).*XRES(:,2).*XRES(:,5))+(XRES(:,4).^2);
%Y = (XRES(:,2)+XRES(:,2)+XRES(:,2)+XRES(:,2))+(XRES(:,1).^(XRES(:,3)))+(XRES(:,1).*XRES(:,4).*XRES(:,5))
Y = ((XRES(:,1).^(XRES(:,3))).*XRES(:,5))+ XRES(:,2) + (XRES(:,4).^(XRES(:,3)))

rstool(XRES,Y,'interaction')
pause
beta_interaction = beta1

NRUNS = 21;
S = S_quadratic;
for i=1:NRUNS
    for j=1:NFACTORS
        XRES(i,j)=X(j,1)+X(j,2)*S(i,j);
        XRES(i,j)=XRES(i,j)*(1 + 0.07*rand(1,1)*sign(randn(1)));
    end
end
%Y= ((XRES(:,4).^3).*XRES(:,5))+((XRES(:,1).^2).*XRES(:,2).*XRES(:,5))+(XRES(:,4).^2);
%Y = (XRES(:,2)+XRES(:,2)+XRES(:,2)+XRES(:,2))+(XRES(:,1).^(XRES(:,3)))+(XRES(:,1).*XRES(:,4).*XRES(:,5))
Y = ((XRES(:,1).^(XRES(:,3))).*XRES(:,5))+ XRES(:,2) + (XRES(:,4).^(XRES(:,3)))

rstool(XRES,Y,'quadratic')
pause
beta_quadratic = beta2

NRUNS = 11;
S = S_purequadratic;
for i=1:NRUNS
    for j=1:NFACTORS
        XRES(i,j)=X(j,1)+X(j,2)*S(i,j);
        XRES(i,j)=XRES(i,j)*(1 + 0.07*rand(1,1)*sign(randn(1)));
    end
end
%Y= ((XRES(:,4).^3).*XRES(:,5))+((XRES(:,1).^2).*XRES(:,2).*XRES(:,5))+(XRES(:,4).^2);
%Y = (XRES(:,2)+XRES(:,2)+XRES(:,2)+XRES(:,2))+(XRES(:,1).^(XRES(:,3)))+(XRES(:,1).*XRES(:,4).*XRES(:,5))
Y = ((XRES(:,1).^(XRES(:,3))).*XRES(:,5))+ XRES(:,2) + (XRES(:,4).^(XRES(:,3)))

rstool(XRES,Y,'purequadratic')
pause
beta_purequadratic = beta3

% 3_4

Neks = 10; % 1 10        
Ntest = 10000; % 100 1000 10000

delta_linear = 0;
delta_interaction = 0;
delta_purequadratic = 0;
delta_quadratic = 0;

eps_linear = 0;
eps_interaction = 0;
eps_purequadratic = 0;
eps_quadratic = 0;

X1=[1 2];
X2=[2 3];
X3=[3 4];
X4=[4 5];
X5=[5 6];

for k = 1: Neks
    for i = 1: Ntest
        x1=X1(1)+(X1(2)-X1(1))*rand(1,1);
        x2=X2(1)+(X2(2)-X2(1))*rand(1,1);
        x3=X3(1)+(X3(2)-X3(1))*rand(1,1);
        x4=X4(1)+(X4(2)-X4(1))*rand(1,1); 
        x5=X5(1)+(X5(2)-X5(1))*rand(1,1);

        beta = beta_linear;
        y_linear = beta(1) + beta(2)*x1 + beta(3)*x2 + beta(4)*x3+beta(5)*x4+beta(6)*x5;

        beta = beta_interaction;
        y_interaction = beta(1) + beta(2)*x1 + beta(3)*x2 + beta(4)*x3+beta(5)*x4+beta(6)*x5+beta(7)*x1*x2+beta(8)*x1*x3+beta(9)*x1*x4+beta(10)*x1*x5+beta(11)*x2*x3+beta(12)*x2*x4 +beta(13)*x2*x5+beta(14)*x3*x4+beta(15)*x3*x5+beta(16)*x4*x5;   

        beta = beta_quadratic;
        y_quadratic = beta(1) + beta(2)*x1 + beta(3)*x2 + beta(4)*x3+beta(5)*x4+beta(6)*x5+beta(7)*x1*x2+beta(8)*x1*x3+beta(9)*x1*x4+beta(10)*x1*x5+beta(11)*x2*x3+beta(12)*x2*x4 +beta(13)*x2*x5+beta(14)*x3*x4+beta(15)*x3*x5+beta(16)*x4*x5+beta(17)*x1*x1+beta(18)*x2*x2+beta(19)*x3*x3+beta(20)*x4*x4+beta(21)*x5*x5;

        beta = beta_purequadratic;
        y_purequadratic = beta(1) + beta(2)*x1 + beta(3)*x2 + beta(4)*x3+beta(5)*x4+beta(6)*x5 +beta(7)*x1*x1+beta(8)*x2*x2+beta(9)*x3*x3+beta(10)*x4*x4+beta(11)*x5*x5;    
        %yt = ((x4.^3).*x5)+((x1.^2).*x2.*x5)+(x4.^2);
        %yt = (x2.*4) + (x1.^x3)+(x1.*x4.*x5)
        yt = ((x1.^3).*x5)+ x2 + (x4.^x3)
        
        delta_linear(i)= abs((y_linear-yt)/yt);
        delta_interaction(i)= abs((y_interaction-yt)/yt);
        delta_quadratic(i)= abs((y_quadratic-yt)/yt);
        delta_purequadratic(i)= abs((y_purequadratic-yt)/yt);   
    end
    eps_linear(k) = mean(delta_linear);
    eps_interaction(k) = mean(delta_interaction);
    eps_quadratic(k) = mean(delta_quadratic);
    eps_purequadratic(k) = mean(delta_purequadratic);
end

eps_mean_linear = mean(eps_linear)
eps_mean_interaction = mean(eps_interaction)
eps_mean_quadratic = mean(eps_quadratic)
eps_mean_purequadratic = mean(eps_purequadratic)