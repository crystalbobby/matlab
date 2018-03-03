close all;
clear all; clc;
%20pa的声压，人耳朵就会感觉到痛
%折算到耳膜受多大的力或者在耳膜上放置多少克的物体，耳朵就会痛

%Ppain = 20; %Pa
Ppain = 20;
P = Ppain;
% P = F / S 
% F = m*a, 对于物块 F= m*g
g = 9.8; %m/s^2

pi = 3.1415926;
%耳膜参数：椭圆形，长9mm，宽8mm，厚度0.1mm
a = 9/2 * 10^(-3); %m
b = 8/2 * 10^(-3); %m
%耳膜面积
S = pi*a*b; %m^2
%耳膜受到的力
F = P*S; %N
%折算成物体的质量
m = F/g; %kg
Weight = m*1000;%g
disp('耳朵的受力情况（牛顿）：')
F

disp('相当于放置的物块的重量(g):')
Weight

disp('each grain of rice weighs approximately 1/64 of a gram(g):')
1/64

disp('大约相当于多少粒大米放在耳膜上：')
Weight/(1/64)




