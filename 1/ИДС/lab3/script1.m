clear all
count = 3000;   % число измерений
M = 0;          % значение мат. ожидания
D = 1;          % значение дисперсии
Dfm = count/2;     % момент возникновения неисправности
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
% Инвариант
delta12(i) = base1(i) - base2(i);
delta13(i) = base1(i) - base3(i);
delta23(i) = base2(i) - base3(i);
% Оценка инварианта
mu1(i) = mean(delta12);
mu2(i) = mean(delta13);
mu3(i) = mean(delta23);
d1(i) = std(delta12);
d2(i) = std(delta13);
d3(i) = std(delta23);
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
% Оценка мат. ожидания
subplot(2,1,1);
plot(T,mu1,'b',T,mu2,'r',T,mu3,'g');
ylabel('M');
% Оценка дисперсии
subplot(2,1,2);
plot(T,d1,'b',T,d2,'r',T,d3,'g');
xlabel('t');
ylabel('D');