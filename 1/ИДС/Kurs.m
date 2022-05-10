clc,clear
n = input('������� ������ ������� n= ');
iter = input('������� ����� �������� �������������: ');
disp(' ')
disp('� ���� ������ ����������� ������������� ������� �������')
disp(' ')

h = zeros(1,5);
gsum = zeros(5,iter);
Pdelta = zeros(5,iter);
N = zeros(5,iter);
x = zeros(1,iter);

disp('� ���� ������ ������������ ���� ������� � ��������� ������� ������� �����������')
h(1,1) = input('������ ����� ������� �����������: ');
h(1,2) = input('������ ����� ������� �����������: ');
h(1,3) = input('������ ����� ������� �����������: ');
h(1,4) = input('��������� ����� ������� �����������: ');
h(1,5) = input('����� ����� ������� �����������: ');
%h(1,1) = 0.02;
%h(1,2) = 0.04;
%h(1,3) = 0.05;
%h(1,4) = 0.07;
%h(1,5) = 0.09;

disp(' ')
disp('��������� �������')
disp('1) ��')
disp('2) ���')
choice = input('�������� �����: ');
disp(' ')

for i=1:1:iter
x(1,i) = i;
end

for i=1:1:5
disp(['������������� ������ ������� ����������� ', num2str(i)])
[gsum(i,:),Pdelta(i,:),N(i,:)] = kursModel(n, choice, h(1,i), iter);
end

tiledlayout('flow')
%�������� ��������������� �������� �������� �������
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
legend('����� �1','����� �2','����� �3','����� �4','����� �5')
title('������� ����������� ������� ������������')
hold off
%������� ����������� ������� ������������
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
legend('����� �1','����� �2','����� �3','����� �4','����� �5')
title('������� ����������� ������� ������������')
hold off
%����� ����������� ������
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
legend('����� �1','����� �2','����� �3','����� �4','����� �5')
title('������� ����������� ������')
hold off