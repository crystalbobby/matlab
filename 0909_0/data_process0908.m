close all;
clear all; clc;

input_range = 10; %Ä¬ÈÏÊäÈë·¶Î§Îª10V

fid1 = fopen('channel_1','rb');
[raw_data1,num1]= fread(fid1,inf,'uchar');
raw_data1 = int32(raw_data1);

fid2 = fopen('channel_2','rb');
[raw_data2,num2]= fread(fid2,inf,'uchar');
raw_data2 = int32(raw_data2);

fid3 = fopen('channel_3','rb');
[raw_data3,num3]= fread(fid3,inf,'uchar');
raw_data3 = int32(raw_data3);

fid4 = fopen('channel_4','rb');
[raw_data4,num4]= fread(fid4,inf,'uchar');
raw_data4 = int32(raw_data4);

%=========================================================================%
j1 = 1;
for i = 1:4:num1
    chan00_data(j1) =  int32(raw_data1(i)*16^6 + raw_data1(i+1)*16^4 + raw_data1(i+2)*16^2 + raw_data1(i+3));  
    j1 = j1 + 1;
end

j2 = 1;
for i = 1:4:num2
    chan01_data(j2) =  int32(raw_data2(i)*16^6 + raw_data2(i+1)*16^4 + raw_data2(i+2)*16^2 + raw_data2(i+3));  
    j2 = j2 + 1;
end


j3 = 1;
for i = 1:4:num3
    chan02_data(j3) =  int32(raw_data3(i)*16^6 + raw_data3(i+1)*16^4 + raw_data3(i+2)*16^2 + raw_data3(i+3));  
    j3 = j3 + 1;
end

j4 = 1;
for i = 1:4:num4
    chan03_data(j4) =  int32(raw_data4(i)*16^6 + raw_data4(i+1)*16^4 + raw_data4(i+2)*16^2 + raw_data4(i+3));  
    j4 = j4 + 1;
end

%=========================================================================%

chan00_ad_data = double(bitshift(chan00_data,-8))/2^24;
chan01_ad_data = double(bitshift(chan01_data,-8))/2^24;
chan02_ad_data = double(bitshift(chan02_data,-8))/2^24;
chan03_ad_data = double(bitshift(chan03_data,-8))/2^24;

if(input_range == 40)
    chan00_ad_data = chan00_ad_data * 51.13636;
    chan01_ad_data = chan02_ad_data * 51.13636;
    chan02_ad_data = chan03_ad_data * 51.13636;
    chan03_ad_data = chan04_ad_data * 51.13636;
    else if(input_range == 10)
        chan00_ad_data = chan00_ad_data * 12.5;
        chan01_ad_data = chan01_ad_data * 12.5;
        chan02_ad_data = chan02_ad_data * 12.5;
        chan03_ad_data = chan03_ad_data * 12.5;
        else if(input_range == 1)
                chan00_ad_data = chan00_ad_data * 1.25;
                chan01_ad_data = chan01_ad_data * 1.25;
                chan02_ad_data = chan02_ad_data * 1.25;
                chan03_ad_data = chan03_ad_data * 1.25;
                else if(input_range == 0.316)
                    chan00_ad_data = chan00_ad_data * 0.3858424;
                    chan01_ad_data = chan01_ad_data * 0.3858424;
                    chan02_ad_data = chan02_ad_data * 0.3858424;
                    chan03_ad_data = chan03_ad_data * 0.3858424;
                    else if(input_range == 0.316)
                        chan00_ad_data = chan00_ad_data * 0.125;
                        chan01_ad_data = chan01_ad_data * 0.125;
                        chan02_ad_data = chan02_ad_data * 0.125;
                        chan03_ad_data = chan03_ad_data * 0.125;
                        end
                    end
             end
        end
end
    
figure(1)
plot(chan00_ad_data,'--ob')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(2)
plot(chan01_ad_data,'--ob')
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(3)
plot(chan02_ad_data,'--*b')
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

figure(4)
plot(chan03_ad_data,'--or')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on