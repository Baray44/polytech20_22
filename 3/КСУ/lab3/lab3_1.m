num = 1;
den = [1 -A(1,1)-A(2,2) A(1,1)*A(2,2)+A(1,2)*A(1,2)];
sys=tf(num,den,-1)
pzmap(sys)%P=pole(sys)
%rlocus(sys)