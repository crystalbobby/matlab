close all;
clear all; clc;

sample_num = 600; %画图时样本的点数

input_range = 0.1; %默认输入范围为1V

%===========================================================================================================================%
%                  SD card files
%
%===========================================================================================================================%
 fid = fopen('dataFile6','rb');
% fid = fopen('channel_100mV_no_connection_20kHz.pcm','rb');
[raw_data,num]= fread(fid,inf,'uchar');

j = 1;
for i = 1:4:num
%     chan_data(j) =  raw_data(i)*16^6 + raw_data(i+1)*16^4 + raw_data(i+2)*16^2 + raw_data(i+3); 
    chan_data(j) =  raw_data(i)*16^6 + raw_data(i+1)*16^4 + raw_data(i+2)*16^2; 
%     chan_data(j) = bitand(int32(chan_data(j)),int32(4294967040));
%     chan_data(j) = double(chan_data(j));
    j = j + 1;
end

N = length(chan_data);

j0 = 1; j1 = 1; j2 = 1; j3 = 1;
for i = 1:4:N
    chan00_data(j0) = chan_data(i);
    if(chan00_data(j0) > 2^31)
       chan00_data(j0) = -(2^32 - chan00_data(j0)); 
    end
    j0 = j0 + 1;
end

for i = 2:4:N
    chan01_data(j1) = chan_data(i);
     if(chan01_data(j1) > 2^31)
       chan01_data(j1) = -(2^32 - chan01_data(j1)); 
    end
    j1 = j1 + 1;
end

for i = 3:4:N
    chan02_data(j2) = chan_data(i);
     if(chan02_data(j2) > 2^31)
       chan02_data(j2) = -(2^32 - chan02_data(j2)); 
    end
    j2 = j2 + 1;
end

for i = 4:4:N
    chan03_data(j3) = chan_data(i);
     if(chan03_data(j3) > 2^31)
       chan03_data(j3) = -(2^32 - chan03_data(j3)); 
    end
    j3 = j3 + 1;
end

chan00_ad_data_sd = double(chan00_data)/2^31;
chan01_ad_data_sd = double(chan01_data)/2^31;
chan02_ad_data_sd = double(chan02_data)/2^31;
chan03_ad_data_sd = double(chan03_data)/2^31;

if(input_range == 40)
    chan00_ad_data_sd = chan00_ad_data_sd * 51.13636;
    chan01_ad_data_sd = chan02_ad_data_sd * 51.13636;
    chan02_ad_data_sd = chan03_ad_data_sd * 51.13636;
    chan03_ad_data_sd = chan04_ad_data_sd * 51.13636;
    else if(input_range == 10)
        chan00_ad_data_sd = chan00_ad_data_sd * 12.5;
        chan01_ad_data_sd = chan01_ad_data_sd * 12.5;
        chan02_ad_data_sd = chan02_ad_data_sd * 12.5;
        chan03_ad_data_sd = chan03_ad_data_sd * 12.5;
        else if(input_range == 1)
                chan00_ad_data_sd = chan00_ad_data_sd * 1.25;
                chan01_ad_data_sd = chan01_ad_data_sd * 1.25;
                chan02_ad_data_sd = chan02_ad_data_sd * 1.25;
                chan03_ad_data_sd = chan03_ad_data_sd * 1.25;
                else if(input_range == 0.316)
                    chan00_ad_data_sd = chan00_ad_data_sd * 0.3858424;
                    chan01_ad_data_sd = chan01_ad_data_sd * 0.3858424;
                    chan02_ad_data_sd = chan02_ad_data_sd * 0.3858424;
                    chan03_ad_data_sd = chan03_ad_data_sd * 0.3858424;
                    else if(input_range == 0.100)
                        chan00_ad_data_sd = chan00_ad_data_sd * 0.125;
                        chan01_ad_data_sd = chan01_ad_data_sd * 0.125;
                        chan02_ad_data_sd = chan02_ad_data_sd * 0.125;
                        chan03_ad_data_sd = chan03_ad_data_sd * 0.125;
                        end
                    end
             end
        end
end

% aaa = chan00_ad_data_sd(1000:513000)';
% save afile.txt -ascii aaa;

%=========================================================================%
%                   int test
%=========================================================================%
% chan00_ad_data_sd = int32(chan00_ad_data_sd);


figure(1)
% subplot(2,2,1)
plot(chan00_ad_data_sd(sample_num:2*sample_num),'--*b')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(2)
% subplot(2,2,2)
%plot(chan01_ad_data_sd(sample_num:2*sample_num),'--*b')
stem(chan01_ad_data_sd(sample_num:2*sample_num))
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(3)
% subplo`t(2,2,3)
 plot(chan02_ad_data_sd(sample_num:2*sample_num),'--*b')
% stem(chan02_ad_data_sd(sample_num:2*sample_num))
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on



figure(4)
% subplot(2,2,4)
% plot(chan03_ad_data,'r')
plot(chan03_ad_data_sd(sample_num:2*sample_num),'--*b')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on
%===========================================================================================================================%
%                 end SD card files
%
%===========================================================================================================================%


