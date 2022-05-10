function [answer, second, third] = kursModel(n, choice, h, iter)
u=0;                        %�������� ���.��������
sigm = 1.5;                 %����������� �������� sigma
a1 = 0.6;                   %�������� ������� ������� ��������������
a2 = 0.2;                   %�������� ������� ������� ��������������
g=0;                        %������������ �������� �������� �������
x1 = 0;                     %�������������� �������� x
gsum = zeros(1,iter);       %��������� �������� �������� �������
Pdelta = zeros(1,iter);     %�������� ����������� ������� ������������
N = zeros(1,iter);          %������ ����������� ������
if(choice == 1)
    error = randi([1 n/2], 1, 1); %��������� ������� ������
    Ntrigger = 0;        
end
 
xm = zeros(1,n);
    B = sigm*sqrt((sigm^2)*(((1+a2)*(((1-a2)^2)-a1^2))/(1-a2)));  %�������� beta
%�������������
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
%������ �����������
 
disp(['������� ������� ����������� ������� ������������: ', num2str(mean(Pdelta))])
if(choice == 1)
    disp(['������� ����� ����������� ������: ',num2str(mean(N))])
end
disp(['������� �������� ��������������� �������� �������� �������: ',num2str(mean(gsum))])
answer = gsum;
second = Pdelta;
third = N;
disp(' ')
end