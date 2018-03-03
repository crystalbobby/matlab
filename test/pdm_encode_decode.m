% 下面程序是对1阶sigma—delt 调制的原理进行仿真测试，目前对∑-△ ADC的原理还不是非常清楚，只是有一个大概的认识。
% 参考资料：http://en.wikipedia.org/wiki/Pulse_density_modulation
% ?? ? ? ? ? ? ? 百度文库：matlab数字低通滤波器仿真
% 
% 程序说明：输入信号x,函数返回数据流y=+/-1;y通过低通滤波器输出y-filter
% % 第一部分为对输入信号进行1阶sigma—delt 调制，第二部分数字滤波
% function [y,y_filter]=sigma_delt(x)
% error(1)=0;
% for i=1:numel(x)-1
%     if(x(i+1)>=error(i))
%         y1(i+1)=1;
%     else
%         y1(i+1)=-1;
%     end
%     error(i+1)=y1(i+1)-x(i)+error(i);
% end
% y=y1(2:end);
% figure(1);
% bar(y);
% %////////////////////////////////////////////////////////////////////////
% %//fir滤波器设计 ?sin(w*t) => w=1,采样速率fs/2对应pi，
% %////////////////////////////////////////////////////////////////////////
% wp=0.05*pi; %wp/pi*fs/2 ?通带
% ws=0.1*pi; %阻带
% wc=(wp+ws)/2; %截止频率
% M=ceil(6.6*pi/(ws-wp));
% %//滤波器阶数M-1
% alpha=(M-1)/2;
% n=0:M-1;
% m=n-alpha+eps;
% hd=sin(wc*m)./(pi*m);
% window=(hamming(M))'; %hamming 窗函数，矩形窗则是0 0 0 1 1 1 1 .. 1 1 1 0 0 0...
% h=hd.*window;%fir单位冲击响应
% y_filter1=conv(h,y); %输出为h与x的卷积
% y_filter=y_filter1(M/2-1:numel(y_filter1)-M/2+1);
% figure(3);
% plot(y_filter);

%最后测试输入信号x
close all;
clear;
clc;
t=0:0.06:2*pi;
x=sin(t);
figure(1)
plot(x)
[y,y_filter] = sigma_delt(x);
