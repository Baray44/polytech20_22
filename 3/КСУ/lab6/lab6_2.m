function [p1, p2, ena1, ena2] = fcn(z1, z2, s1, s2)
persistent p1_t;
persistent p2_t;
persistent ena1_t;
persistent ena2_t;
eps =  0.005;  % Величина отклонения оценки от реального значения
step = 0.025;  % Шаг изменения множителей p
% Инициализация
if(isempty(p1_t))
    p1_t =-1.0;%4;%-5;% 1.5;
    p2_t =-1;%-4.0;%5;%-5;% -1.5;
    ena1_t = 0;%0
    ena2_t = 0;%0
    p1 = p1_t;
    p2 = p2_t;
    ena1 = ena1_t;
    ena2 = ena2_t;
    return;
end
% Коррекция множителя p1
if(abs(p2_t*z2-p2_t*s1+p1_t*z1-p1_t*s2) > eps)%(2*abs((p2_t*z2-p1_t*s1+p1_t*z1-p2_t*s2)/(abs(p1_t)+abs(p2_t))) > eps)%(abs((z1-s2)) > eps || abs((z2-s1)) > eps)
   % Знак перед step завистит от знака s2
   %p1_t = p1_t+step*(z1-(0.2)*s2);
   p1_t = p1_t+step*(z1-s2);
   ena1_t = 0; 
   
   %p2_t = p2_t+step*(z2-(-0.2)*s1);
   p2_t = p2_t+step*(z2-s1);
   ena2_t = 0; 
else
   ena1_t = 1;   
   ena2_t = 1; 
end
p1 = p1_t;
p2 = p2_t;
ena1 = ena1_t;
ena2 = ena2_t;
end