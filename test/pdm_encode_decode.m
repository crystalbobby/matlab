% ��������Ƕ�1��sigma��delt ���Ƶ�ԭ����з�����ԣ�Ŀǰ�ԡ�-�� ADC��ԭ�����Ƿǳ������ֻ����һ����ŵ���ʶ��
% �ο����ϣ�http://en.wikipedia.org/wiki/Pulse_density_modulation
% ?? ? ? ? ? ? ? �ٶ��Ŀ⣺matlab���ֵ�ͨ�˲�������
% 
% ����˵���������ź�x,��������������y=+/-1;yͨ����ͨ�˲������y-filter
% % ��һ����Ϊ�������źŽ���1��sigma��delt ���ƣ��ڶ����������˲�
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
% %//fir�˲������ ?sin(w*t) => w=1,��������fs/2��Ӧpi��
% %////////////////////////////////////////////////////////////////////////
% wp=0.05*pi; %wp/pi*fs/2 ?ͨ��
% ws=0.1*pi; %���
% wc=(wp+ws)/2; %��ֹƵ��
% M=ceil(6.6*pi/(ws-wp));
% %//�˲�������M-1
% alpha=(M-1)/2;
% n=0:M-1;
% m=n-alpha+eps;
% hd=sin(wc*m)./(pi*m);
% window=(hamming(M))'; %hamming �����������δ�����0 0 0 1 1 1 1 .. 1 1 1 0 0 0...
% h=hd.*window;%fir��λ�����Ӧ
% y_filter1=conv(h,y); %���Ϊh��x�ľ��
% y_filter=y_filter1(M/2-1:numel(y_filter1)-M/2+1);
% figure(3);
% plot(y_filter);

%�����������ź�x
close all;
clear;
clc;
t=0:0.06:2*pi;
x=sin(t);
figure(1)
plot(x)
[y,y_filter] = sigma_delt(x);
