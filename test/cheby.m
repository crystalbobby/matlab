clear;clc;
fs=100;
Wp=8; 
Ws=12; 
Rp=2;  
Rs=40;%����ָ�����  
[N,wp1]=cheb1ord(Wp/(fs/2),Ws/(fs/2),Rp,Rs);%����cheb1ord�������˲�����С����  
[b,a]=cheby1(N,Rp,wp1); %�����б�ѩ��I��ģ���ͨ�˲���ϵͳ����ϵ��  
[H,f]=freqz(b,a,512,100); %���ֵH��Ƶ��f 
plot(f,abs(H)); 