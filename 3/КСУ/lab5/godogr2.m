
sys=tf(1,[1 24 140],-1)
pzmap(sys)%P=pole(sys)
%rlocus(sys)