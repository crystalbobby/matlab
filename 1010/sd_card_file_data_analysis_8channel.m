close all;
clear all; clc;

sample_num = 50; %画图时样本的点数

input_range = 10; %默认输入范围为10V

%===========================================================================================================================%
%                  SD card files
%
%===========================================================================================================================%
fid = fopen('data1_sd_12345678','rb');
[raw_data,num]= fread(fid,inf,'uchar');

j = 1;
for i = 1:4:num
    chan_data(j) =  raw_data(i)*16^6 + raw_data(i+1)*16^4 + raw_data(i+2)*16^2 + raw_data(i+3); 
    j = j + 1;
end

N = length(chan_data);

j0 = 1; j1 = 1; j2 = 1; j3 = 1;j4 = 1; j5 = 1; j6 = 1; j7 = 1;
for i = 1:8:N
    chan00_data(j0) = chan_data(i);
    if(chan00_data(j0) > 2^31)
       chan00_data(j0) = -(2^32 - chan00_data(j0)); 
    end
    j0 = j0 + 1;
end

for i = 2:8:N
    chan01_data(j1) = chan_data(i);
     if(chan01_data(j1) > 2^31)
       chan01_data(j1) = -(2^32 - chan01_data(j1)); 
    end
    j1 = j1 + 1;
end

for i = 3:8:N
    chan02_data(j2) = chan_data(i);
     if(chan02_data(j2) > 2^31)
       chan02_data(j2) = -(2^32 - chan02_data(j2)); 
    end
    j2 = j2 + 1;
end

for i = 4:8:N
    chan03_data(j3) = chan_data(i);
     if(chan03_data(j3) > 2^31)
       chan03_data(j3) = -(2^32 - chan03_data(j3)); 
    end
    j3 = j3 + 1;
end

for i = 5:8:N
    chan04_data(j4) = chan_data(i);
     if(chan04_data(j4) > 2^31)
       chan04_data(j4) = -(2^32 - chan04_data(j4)); 
    end
    j4 = j4 + 1;
end

for i = 6:8:N
    chan05_data(j5) = chan_data(i);
     if(chan05_data(j5) > 2^31)
       chan05_data(j5) = -(2^32 - chan05_data(j5)); 
    end
    j5 = j5 + 1;
end

for i = 7:8:N
    chan06_data(j6) = chan_data(i);
     if(chan06_data(j6) > 2^31)
       chan06_data(j6) = -(2^32 - chan06_data(j6)); 
    end
    j6 = j6 + 1;
end

for i = 8:8:N
    chan07_data(j7) = chan_data(i);
     if(chan07_data(j7) > 2^31)
       chan07_data(j7) = -(2^32 - chan07_data(j7)); 
    end
    j7 = j7 + 1;
end


chan00_ad_data_sd = double(chan00_data)/2^31;
chan01_ad_data_sd = double(chan01_data)/2^31;
chan02_ad_data_sd = double(chan02_data)/2^31;
chan03_ad_data_sd = double(chan03_data)/2^31;

chan04_ad_data_sd = double(chan04_data)/2^31;
chan05_ad_data_sd = double(chan05_data)/2^31;
chan06_ad_data_sd = double(chan06_data)/2^31;
chan07_ad_data_sd = double(chan07_data)/2^31;



if(input_range == 40)
    chan00_ad_data_sd = chan00_ad_data_sd * 51.13636;
    chan01_ad_data_sd = chan02_ad_data_sd * 51.13636;
    chan02_ad_data_sd = chan03_ad_data_sd * 51.13636;
    chan03_ad_data_sd = chan04_ad_data_sd * 51.13636;
    
    chan04_ad_data_sd = chan04_ad_data_sd * 51.13636;
    chan05_ad_data_sd = chan05_ad_data_sd * 51.13636;
    chan06_ad_data_sd = chan06_ad_data_sd * 51.13636;
    chan07_ad_data_sd = chan07_ad_data_sd * 51.13636;
    else if(input_range == 10)
        chan00_ad_data_sd = chan00_ad_data_sd * 12.5;
        chan01_ad_data_sd = chan01_ad_data_sd * 12.5;
        chan02_ad_data_sd = chan02_ad_data_sd * 12.5;
        chan03_ad_data_sd = chan03_ad_data_sd * 12.5;
        
        chan04_ad_data_sd = chan04_ad_data_sd * 12.5;
        chan05_ad_data_sd = chan05_ad_data_sd * 12.5;
        chan06_ad_data_sd = chan06_ad_data_sd * 12.5;
        chan07_ad_data_sd = chan07_ad_data_sd * 12.5;
        else if(input_range == 1)
                chan00_ad_data_sd = chan00_ad_data_sd * 1.25;
                chan01_ad_data_sd = chan01_ad_data_sd * 1.25;
                chan02_ad_data_sd = chan02_ad_data_sd * 1.25;
                chan03_ad_data_sd = chan03_ad_data_sd * 1.25;
                
                chan04_ad_data_sd = chan04_ad_data_sd * 1.25;
                chan05_ad_data_sd = chan05_ad_data_sd * 1.25;
                chan06_ad_data_sd = chan06_ad_data_sd * 1.25;
                chan07_ad_data_sd = chan07_ad_data_sd * 1.25;
                else if(input_range == 0.316)
                    chan00_ad_data_sd = chan00_ad_data_sd * 0.3858424;
                    chan01_ad_data_sd = chan01_ad_data_sd * 0.3858424;
                    chan02_ad_data_sd = chan02_ad_data_sd * 0.3858424;
                    chan03_ad_data_sd = chan03_ad_data_sd * 0.3858424;
                    
                    chan04_ad_data_sd = chan04_ad_data_sd * 0.3858424;
                    chan05_ad_data_sd = chan05_ad_data_sd * 0.3858424;
                    chan06_ad_data_sd = chan06_ad_data_sd * 0.3858424;
                    chan07_ad_data_sd = chan07_ad_data_sd * 0.3858424;
                    else if(input_range == 0.100)
                        chan00_ad_data_sd = chan00_ad_data_sd * 0.125;
                        chan01_ad_data_sd = chan01_ad_data_sd * 0.125;
                        chan02_ad_data_sd = chan02_ad_data_sd * 0.125;
                        chan03_ad_data_sd = chan03_ad_data_sd * 0.125;
                        
                        chan04_ad_data_sd = chan04_ad_data_sd * 0.125;
                        chan05_ad_data_sd = chan05_ad_data_sd * 0.125;
                        chan06_ad_data_sd = chan06_ad_data_sd * 0.125;
                        chan07_ad_data_sd = chan07_ad_data_sd * 0.125;
                        end
                    end
             end
        end
end
%=========================================================================%
%                   int test
%=========================================================================%
% chan00_ad_data_sd = int32(chan00_ad_data_sd);


figure(1)
% subplot(2,2,1)
plot(chan00_ad_data_sd(1:sample_num),'--*b')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(2)
% subplot(2,2,2)
plot(chan01_ad_data_sd(1:sample_num),'--*b')
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(3)
% subplo`t(2,2,3)
plot(chan02_ad_data_sd(1:sample_num),'--*b')
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(4)
% subplot(2,2,4)
% plot(chan03_ad_data,'r')
plot(chan03_ad_data_sd(1:sample_num),'--*b')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on



figure(5)
% subplot(2,2,1)
plot(chan04_ad_data_sd(1:sample_num),'--*b')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(6)
% subplot(2,2,2)
plot(chan05_ad_data_sd(1:sample_num),'--*b')
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(7)
% subplo`t(2,2,3)
plot(chan06_ad_data_sd(1:sample_num),'--*b')
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(8)
% subplot(2,2,4)
% plot(chan03_ad_data,'r')
plot(chan07_ad_data_sd(1:sample_num),'--*b')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on
%===========================================================================================================================%
%                 end SD card files
%
%===========================================================================================================================%


