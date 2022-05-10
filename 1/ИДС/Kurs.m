clc,clear
n = input('Введите размер выборки n= ');
iter = input('Введите число итераций моделирования: ');
disp(' ')
disp('В ходе работы применяется авторегрессия второго порядка')
disp(' ')

h = zeros(1,5);
gsum = zeros(5,iter);
Pdelta = zeros(5,iter);
N = zeros(5,iter);
x = zeros(1,iter);

disp('В ходе работы моделируются пять выборок с различным порогом ложного обнаружения')
h(1,1) = input('Первый порог ложного обнаружения: ');
h(1,2) = input('Второй порог ложного обнаружения: ');
h(1,3) = input('Третий порог ложного обнаружения: ');
h(1,4) = input('Четвертый порог ложного обнаружения: ');
h(1,5) = input('Пятый порог ложного обнаружения: ');
%h(1,1) = 0.02;
%h(1,2) = 0.04;
%h(1,3) = 0.05;
%h(1,4) = 0.07;
%h(1,5) = 0.09;

disp(' ')
disp('Внедрение дефекта')
disp('1) Да')
disp('2) Нет')
choice = input('Сделайте выбор: ');
disp(' ')

for i=1:1:iter
x(1,i) = i;
end

for i=1:1:5
disp(['Моделирование порога ложного обнаружения ', num2str(i)])
[gsum(i,:),Pdelta(i,:),N(i,:)] = kursModel(n, choice, h(1,i), iter);
end

tiledlayout('flow')
%Значения математического ожидания решающей функции
nexttile
plot(x,gsum(1,:),'r-');
hold on
plot(x,gsum(2,:),'b-');
hold on
plot(x,gsum(3,:),'g-');
hold on
plot(x,gsum(4,:),'c-');
hold on
plot(x,gsum(5,:),'m-');
hold on
legend('Порог №1','Порог №2','Порог №3','Порог №4','Порог №5')
title('Уровень вероятности ложного срабатывания')
hold off
%Уровень вероятности ложного срабатывания
nexttile
plot(x,Pdelta(1,:),'r--');
hold on
plot(x,Pdelta(2,:),'b--');
hold on
plot(x,Pdelta(3,:),'g--');
hold on
plot(x,Pdelta(4,:),'c--');
hold on
plot(x,Pdelta(5,:),'m--');
hold on
legend('Порог №1','Порог №2','Порог №3','Порог №4','Порог №5')
title('Уровень вероятности ложного срабатывания')
hold off
%Время обнаружения ошибки
nexttile
plot(x,N(1,:),'r-o');
hold on
plot(x,N(2,:),'b-o');
hold on
plot(x,N(3,:),'g-o');
hold on
plot(x,N(4,:),'c-o');
hold on
plot(x,N(5,:),'m-o');
hold on
legend('Порог №1','Порог №2','Порог №3','Порог №4','Порог №5')
title('Временя обнаружения ошибки')
hold off