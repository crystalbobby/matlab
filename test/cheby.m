clear;clc;
fs=100;
Wp=8; 
Ws=12; 
Rp=2;  
Rs=40;%设置指标参数  
[N,wp1]=cheb1ord(Wp/(fs/2),Ws/(fs/2),Rp,Rs);%利用cheb1ord函数求滤波器最小阶数  
[b,a]=cheby1(N,Rp,wp1); %计算切比雪夫I型模拟低通滤波器系统函数系数  
[H,f]=freqz(b,a,512,100); %求幅值H，频率f 
plot(f,abs(H)); 