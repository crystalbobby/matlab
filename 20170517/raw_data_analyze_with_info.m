close all;
clear all; clc;

block_size = 1024;

%===========================================================================================================================%
%                  SD card files processing
%
%===========================================================================================================================%
% input signal: sinwave 5V, 1000Hz
% input range: 10V  -- Gain 12.5

 fid = fopen('Record20170515061151.dat','rb');
[raw_data,num]= fread(fid,inf,'uchar');
% dec2hex(raw_data(1:100));

j = 1;
for i = 1:4:num
%     data = raw_data(1) + raw_data(2)*16^2 +  raw_data(3)^4 + raw_data(4)^6;
      data(j) = raw_data(i+1)*16^2 + raw_data(i+2)*16^4 + raw_data(i+3)*16^6; % little endian data
      j = j + 1;
end

% data_hex = dec2hex(data);
data = data';

N = length(data);

% process the nagitive data, two's supplement
for i = 1: N
    if(data(i) > 2^31)
        data(i) = -(2^32 - data(i));
    end
end

for i = 1:N
   data(i) = data(i)/2^31 * 12.5; % Normalization and multiply the gain
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             separate different channel data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;
for i = 0:N/4096 -1
    for j = 1:1024
        ch01_data(k) = data(4096*i + j);
        ch02_data(k) = data(4096*i + j + 1024);
        ch03_data(k) = data(4096*i + j + 2048);
        ch04_data(k) = data(4096*i + j + 3072);
        k = k + 1;
    end
end


for x = 1:1024
    y(x) = ch01_data(x);
end
xx=1:1024;

% figure(1)
% plot(ch01_data);
% figure(2) 
% plot(ch02_data);
% figure(3)
% plot(ch03_data)
% figure(4)
% plot(ch04_data)

figure(1)
plot(data(N-4096+1: N-3072));
figure(2) 
plot(data(N-3072+1: N-2048));
figure(3)
plot(data(N-2048+1: N-1024));
figure(4)
plot(data(N-1024+1: N))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             figure plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1)
% plot(data(1:block_size),'--*b');
% xlabel('Sample number')
% ylabel('Amplitude / V')
% grid on
% 
% figure(2)
% plot(data(block_size+1:2*block_size),'--*b');
% xlabel('Sample number')
% ylabel('Amplitude / V')
% grid on
% 
% figure(3)
% plot(data(2*block_size+1:3*block_size),'--*b');
% xlabel('Sample number')
% ylabel('Amplitude / V')
% grid on
% 
% figure(4)
% plot(data(3*block_size+1:4*block_size),'--*b');
% xlabel('Sample number')
% ylabel('Amplitude / V')
% grid on

%===========================================================================================================================%
%                 End SD card files processing
%
%===========================================================================================================================%


