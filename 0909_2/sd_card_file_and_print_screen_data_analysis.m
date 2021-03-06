close all;
clear all; clc;

sample_num = 500; %画图时样本的点数

input_range = 10; %默认输入范围为10V

%===========================================================================================================================%
%                  SD card files
%
%===========================================================================================================================%
fid1 = fopen('channel_1','rb');
[raw_data1,num1]= fread(fid1,inf,'uchar');
raw_data1 = raw_data1;

fid2 = fopen('channel_2','rb');
[raw_data2,num2]= fread(fid2,inf,'uchar');
raw_data2 = raw_data2;

fid3 = fopen('channel_3','rb');
[raw_data3,num3]= fread(fid3,inf,'uchar');
raw_data3 = raw_data3;

fid4 = fopen('channel_4','rb');
[raw_data4,num4]= fread(fid4,inf,'uchar');
raw_data4 = raw_data4;

%=========================================================================%
j1 = 1;j2 = 1; j3 = 1; j4 = 1;
for i = 1:4:num1
    chan00_data(j1) =  raw_data1(i)*16^6 + raw_data1(i+1)*16^4 + raw_data1(i+2)*16^2 + raw_data1(i+3); 
    if(chan00_data(j1) > 2^31)
        chan00_data(j1) = -(2^32 - chan00_data(j1));
    end
    j1 = j1 + 1;
end
%     hex_chan00 = dec2hex(chan00_data);

for i = 1:4:num2
    chan01_data(j2) =  raw_data2(i)*16^6 + raw_data2(i+1)*16^4 + raw_data2(i+2)*16^2 + raw_data2(i+3);  
     if(chan01_data(j2) > 2^31)
        chan01_data(j2) = -(2^32 - chan01_data(j2));
    end
    j2 = j2 + 1;
end

for i = 1:4:num3
    chan02_data(j3) =  raw_data3(i)*16^6 + raw_data3(i+1)*16^4 + raw_data3(i+2)*16^2 + raw_data3(i+3);  
     if(chan02_data(j3) > 2^31)
        chan02_data(j3) = -(2^32 - chan02_data(j3));
    end
    j3 = j3 + 1;
end

for i = 1:4:num4
    chan03_data(j4) =  raw_data4(i)*16^6 + raw_data4(i+1)*16^4 + raw_data4(i+2)*16^2 + raw_data4(i+3);
     if(chan03_data(j4) > 2^31)
        chan03_data(j4) = -(2^32 - chan03_data(j4));
    end
    j4 = j4 + 1;
end

% chan00_sd_hex = dec2hex(chan00_data);
% chan01_sd_hex = dec2hex(chan01_data);
% chan02_sd_hex = dec2hex(chan02_data);
% chan03_sd_hex = dec2hex(chan03_data);



% chan00_ad_data_sd = double(bitshift(chan00_data,-8))/2^24;
% chan01_ad_data_sd = double(bitshift(chan01_data,-8))/2^24;
% chan02_ad_data_sd = double(bitshift(chan02_data,-8))/2^24;
% chan03_ad_data_sd = double(bitshift(chan03_data,-8))/2^24;
chan00_ad_data_sd = double(chan00_data)/2^32;
chan01_ad_data_sd = double(chan01_data)/2^32;
chan02_ad_data_sd = double(chan02_data)/2^32;
chan03_ad_data_sd = double(chan03_data)/2^32;

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


figure(1)
% subplot(2,2,1)
plot(chan00_ad_data_sd(1:sample_num),'--*b')
% plot(chan00_ad_data_sd,'b')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(2)
% subplot(2,2,2)
plot(chan01_ad_data_sd(1:sample_num),'--*b')
% plot(chan01_ad_data_sd,'b')
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(3)
% subplot(2,2,3)
plot(chan02_ad_data_sd(1:sample_num),'--*b')
% plot(chan02_ad_data_sd,'b')
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(4)
% subplot(2,2,4)
% plot(chan03_ad_data,'r')
plot(chan03_ad_data_sd(1:sample_num),'--*b')
% plot(chan02_ad_data_sd,'b')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on
%===========================================================================================================================%
%                 end SD card files
%
%===========================================================================================================================%


