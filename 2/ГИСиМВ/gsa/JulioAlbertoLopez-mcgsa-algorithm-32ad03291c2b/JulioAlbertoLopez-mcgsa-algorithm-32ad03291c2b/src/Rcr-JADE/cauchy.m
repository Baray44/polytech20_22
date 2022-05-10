
function rc = cauchy(xo,ga);

x = rand(1);
rc = xo+ga*tan(pi*(x-0.5));

%rc=zeros(1000000,1);
%x=rand(1000000,1);
%sum=zeros(1000000,1);
%for i=1: 1000000
%xo=0;
%ga=1;
%rc(i) = xo+ga*tan(pi*(x(i)-0.5));
%end;

%z1 = -10:0.1:10;
%format bank
%cac=hist(rc,z1);
%cac2=cac*10/1000000;
%plot(z1,cac2,'-r');
%hold on
%yy = 1./(pi*ga*(1+((z1-xo)/ga).^2));          %(xx-xo)/ga));
%plot(z1,yy);
return;