
clc;
clear;
close all;

g = tf([100000 0],[1 21 10020 10000]);
bode(g)
%1)H(s) = s;
% 2)H(s) = 1/s
% 
% g1 = tf([1 0],[1]);
% figure(3)
% bode(g1)
% g2 = tf([1],[1 0]);
% figure(4)
% bode(g2)
% 
% g3 = tf([1, 10], [1, 100]);
% figure(5)
% bode(g3)
% 
% 
% g4 = tf([-2 0], [1/10*1/20000, 1/10+1/20000, 1]);
% figure(6)
% bode(g4)

