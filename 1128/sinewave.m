f = 1; % 信号频率
Fs = 16*100/33; % 48.48Mhz 实际采样频率
lengthy = 1024;
y = [];
n = 0:1:lengthy-1;
t = n/Fs;
y = sin(2*pi*f*t);
plot(t,y,'r');