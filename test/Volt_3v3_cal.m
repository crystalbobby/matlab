clc;clear;
Vo = 3.3;% V
Vref = 1.245; %V

%temp = R1/R2;

temp = Vo/Vref - 1;
R2= [1, 1.21, 1.52, 2.49 3.32,6.19]';%K

R1 = temp .* R2;

disp('R394  R393')
[R1  R2]
