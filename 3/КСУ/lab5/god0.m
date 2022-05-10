kc=12
num = 1;
den = [1 (2)*kc kc*kc];
sys=tf(num,den,-1)
%P=pole(sys)
%rlocus(sys)



pzmap(sys)
%rlocus(sys)
%zgrid()

%Z=zero(sys); zplane(P,Z)
