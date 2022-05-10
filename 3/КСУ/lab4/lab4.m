function main_korni
disp('start');
l=1000,lpl=5;
rez_a(lpl, l)=10000000;
rez_d(lpl, l)=10000000;
sh1=0.2, sh2=0.01;
centr1=6.0; centr2=-1.1;%3.666666666666;
K11=[-(lpl-1.0)*sh1/2+centr1: sh1: (lpl-1.0)*sh1/2+centr1]
K22=[-(l-1.0)*sh2/2+centr2: sh2: (l-1.0)*sh2/2+centr2]
for k11=1:lpl
for k22=1:l
[rez_a(k11, k22), rez_d(k11, k22)]=korni(K11(k11), K22(k22));
end
end
plpl=rez_a+rez_d
pl_re=real(plpl), pl_im=imag(plpl);
plmn=rez_a-rez_d
mn_re=real(plmn), mn_im=imag(plmn);
plot(pl_re(1,:),pl_im(1,:), pl_re(2,:),pl_im(2,:), pl_re(3,:),pl_im(3,:), pl_re(4,:),pl_im(4,:), pl_re(5,:),pl_im(5,:), mn_re(1,:),mn_im(1,:), mn_re(2,:),mn_im(2,:), mn_re(3,:),mn_im(3,:), mn_re(4,:),mn_im(4,:), mn_re(5,:),mn_im(5,:))
num=2;
%plot(pl_re(num,:),pl_im(num,:), mn_re(num,:),mn_im(num,:))
[ra, rd]=korni(K11(num), 4);
ra+ rd
ra- rd
K11, K22
disp('finish');
end
function [a, d]=korni( k1, k2);
a=-k1-k2-2;
d=0.5*sqrt((2*k1+2*k2+4)^2 - 16*(k1+1)*(k2+1)-0.64)+0*i;
end