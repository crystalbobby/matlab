f = 1; % �ź�Ƶ��
Fs = 16*100/33; % 48.48Mhz ʵ�ʲ���Ƶ��
lengthy = 1024;
y = [];
n = 0:1:lengthy-1;
t = n/Fs;
y = sin(2*pi*f*t);
plot(t,y,'r');