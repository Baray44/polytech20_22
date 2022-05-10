function [answer, second, third] = kursModel(n, choice, h, iter)
u=0;                        %Значение мат.ожидания
sigm = 1.5;                 %Изначальное значение sigma
a1 = 0.6;                   %Значение первого условия стационарности
a2 = 0.2;                   %Значение второго условия стационарности
g=0;                        %Итерационное значение решающей функции
x1 = 0;                     %Дополнительное значение x
gsum = zeros(1,iter);       %Суммарное значение решающей функции
Pdelta = zeros(1,iter);     %Значение вероятности ложного срабатывания
N = zeros(1,iter);          %Период обнаружения ошибки
if(choice == 1)
    error = randi([1 n/2], 1, 1); %Генерация момента ошибки
    Ntrigger = 0;        
end
 
xm = zeros(1,n);
    B = sigm*sqrt((sigm^2)*(((1+a2)*(((1-a2)^2)-a1^2))/(1-a2)));  %Значение beta
%Моделирование
for j=1:1:iter
    for i=1:1:n
        if (choice == 1 && i == error)
            sigm = 2.5;
                B = sigm*sqrt((sigm^2)*(((1+a2)*(((1-a2)^2)-a1^2))/(1-a2)));
            Ntrigger = 1;
        end
        z = rand; 
            bz = B*z;
            x = a1*x1 + bz;
            g = abs((((x-u-a1*(x1-u))^2)/(B^2))-1);
        gsum(1,j) = gsum(1,j) +g;
 
        if (choice == 1 && Ntrigger == 1)
            N(1,j) = N(1,j) +1;
            if(gsum(1,j)/(sqrt(2)*n)>=h)
                Ntrigger = 0;
            end
        end
 
        if(gsum(1,j)/(sqrt(2)*n)>=h)
            Pdelta(1,j) = Pdelta(1,j) + 1;
            gsum(1,j)=0;
        end
        xm(1,i) = x;
        x1=x;
    end
    gsum(1,j) = gsum(1,j)/(sqrt(2)*n);
    Pdelta(1,j) = Pdelta(1,j)/n;
end
%Анализ результатов
 
disp(['Средний уровень вероятности ложного срабатывания: ', num2str(mean(Pdelta))])
if(choice == 1)
    disp(['Среднее время обнаружения ошибки: ',num2str(mean(N))])
end
disp(['Среднее значение математического ожидания решающей функции: ',num2str(mean(gsum))])
answer = gsum;
second = Pdelta;
third = N;
disp(' ')
end