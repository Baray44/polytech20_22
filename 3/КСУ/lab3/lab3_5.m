num = 1;
den = [1 24 140];
sys=tf(num,den,-1)
pzmap(sys)%P=pole(sys)
%rlocus(sys)