clear all
count = 3000;   % ����� ���������
M = 0;          % �������� ���. ��������
D = 1;          % �������� ���������
Dfm = 2500;     % ������ ������������� �������������
T = 1:count;     
for i=1:count
if (i < Dfm)
base1(i) = normrnd(0,1);
base2(i) = normrnd(0,1);
base3(i) = normrnd(0,1);
else
base1(i) = normrnd(M,D);
base2(i) = normrnd(0,1);
base3(i) = normrnd(0,1);
end
% ���������
delta1(i) = base1(i) - 1/3*(base1(i)+base2(i)+base3(i));
delta2(i) = base2(i) - 1/3*(base1(i)+base2(i)+base3(i));
delta3(i) = base3(i) - 1/3*(base1(i)+base2(i)+base3(i));
% ������ ����������
mu1(i) = mean(delta1);
mu2(i) = mean(delta2);
mu3(i) = mean(delta3);
d1(i) = std(delta1);
d2(i) = std(delta2);
d3(i) = std(delta3);
end
figure
subplot(3,1,1);
plot(T,base1,'b');
ylabel('y1');
subplot(3,1,2);
plot(T,base2,'r');
ylabel('y2');
subplot(3,1,3);
plot(T,base3,'g');
xlabel('t');
ylabel('y3');
figure
% ������ ���. ��������
subplot(2,1,1);
plot(T,mu1,'b',T,mu2,'r',T,mu3,'g');
ylabel('M');
% ������ ���������
subplot(2,1,2);
plot(T,d1,'b',T,d2,'r',T,d3,'g');
xlabel('t');
ylabel('D');