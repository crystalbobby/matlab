close all;
clear all; clc;
%20pa����ѹ���˶���ͻ�о���ʹ
%���㵽��Ĥ�ܶ����������ڶ�Ĥ�Ϸ��ö��ٿ˵����壬����ͻ�ʹ

%Ppain = 20; %Pa
Ppain = 20;
P = Ppain;
% P = F / S 
% F = m*a, ������� F= m*g
g = 9.8; %m/s^2

pi = 3.1415926;
%��Ĥ��������Բ�Σ���9mm����8mm�����0.1mm
a = 9/2 * 10^(-3); %m
b = 8/2 * 10^(-3); %m
%��Ĥ���
S = pi*a*b; %m^2
%��Ĥ�ܵ�����
F = P*S; %N
%��������������
m = F/g; %kg
Weight = m*1000;%g
disp('��������������ţ�٣���')
F

disp('�൱�ڷ��õ���������(g):')
Weight

disp('each grain of rice weighs approximately 1/64 of a gram(g):')
1/64

disp('��Լ�൱�ڶ��������׷��ڶ�Ĥ�ϣ�')
Weight/(1/64)




