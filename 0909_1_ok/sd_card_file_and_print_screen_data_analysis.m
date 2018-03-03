close all;
clear all; clc;

sample_num = 500; %��ͼʱ�����ĵ���

input_range = 10; %Ĭ�����뷶ΧΪ10V

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


% figure(1)
subplot(2,2,1)
plot(chan00_ad_data_sd(1:sample_num),'--*b')
title('Channel 00 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

% figure(2)
subplot(2,2,2)
plot(chan01_ad_data_sd(1:sample_num),'--*b')
title('Channel 01 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

% figure(3)
subplot(2,2,3)
plot(chan02_ad_data_sd(1:sample_num),'--*b')
title('Channel 02 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on

% figure(4)
subplot(2,2,4)
% plot(chan03_ad_data,'r')
plot(chan03_ad_data_sd(1:sample_num),'--*b')
title('Channel 03 with no input signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on
%===========================================================================================================================%
%                 end SD card files
%
%===========================================================================================================================%


%===========================================================================================================================%
%                  data printed on PC display
%
%===========================================================================================================================%

raw_data=textread('print0909','%s')';%���ַ���ʽ���ļ� 
data=hex2dec(raw_data)'; %16����ת��Ϊ10������������alpha���� 
N = length(data);

%========================================================================%
%             �����ݰ�ͨ���ŷ���
%========================================================================%
j0 = 1; j1 = 1; j2 = 1; j3 = 1;
for j = 1:N
    if(rem(data(j),16) == 0 || rem(data(j),16) == 4 || rem(data(j),16) == 8 || rem(data(j),16) == 12 )  % channel 00
        channel_01(j0) = data(j);
        if(channel_01(j0) > 2^31)
            channel_01(j0) = -(2^32 - channel_01(j0));
        end
         j0 = j0+1;
    else if(rem(data(j),16) == 1 || rem(data(j),16) == 5 || rem(data(j),16) == 9 || rem(data(j),16) == 13)  % channel 01
         channel_02(j1) = data(j);
         if(channel_02(j1) > 2^31)
            channel_02(j1) = -(2^32 - channel_02(j1));
        end
         j1 = j1+1;
        else if(rem(data(j),16) == 2 || rem(data(j),16) == 6 || rem(data(j),16) == 10 || rem(data(j),16) == 14)  % channel 02
                channel_03(j2) = data(j);
                if(channel_03(j2) > 2^31)
                    channel_03(j2) = -(2^32 - channel_03(j2));
                end
                j2 = j2+1;
           else if(rem(data(j),16) == 3 || rem(data(j),16) == 7 || rem(data(j),16) == 11 || rem(data(j),15) == 15)  % channel 03
                channel_04(j3) = data(j);
                if(channel_04(j3) > 2^31)
                    channel_04(j3) = -(2^32 - channel_04(j3));
                end
                j3 = j3+1;
               end
            end
        end
    end
end

% channel_00_hex = dec2hex(channel_01);
% channel_01_hex = dec2hex(channel_02);
% channel_02_hex = dec2hex(channel_03);
% channel_03_hex = dec2hex(channel_04);


% chan00_ad_data = double(bitshift(channel_01,-8))/2^24;
% chan01_ad_data = double(bitshift(channel_02,-8))/2^24;
% chan02_ad_data = double(bitshift(channel_03,-8))/2^24;
% chan03_ad_data = double(bitshift(channel_04,-8))/2^24;

chan00_ad_data = double(channel_01)/2^32;
chan01_ad_data = double(channel_02)/2^32;
chan02_ad_data = double(channel_03)/2^32;
chan03_ad_data = double(channel_04)/2^32;

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
                    else if(input_range == 0.100)
                        chan00_ad_data = chan00_ad_data * 0.125;
                        chan01_ad_data = chan01_ad_data * 0.125;
                        chan02_ad_data = chan02_ad_data * 0.125;
                        chan03_ad_data = chan03_ad_data * 0.125;
                        end
                    end
             end
        end
end

% 
% % figure (5)
 figure
% subplot(2,2,1)
plot(chan00_ad_data(1:sample_num),'--*b')
grid on
% 
% % figure (6)
% subplot(2,2,2)
% plot(chan01_ad_data(1:sample_num),'--*b')
% grid on
% 
% % figure (7)
% subplot(2,2,3)
% plot(chan02_ad_data(1:sample_num),'--*b')
% grid on
% 
% % figure (8)
% subplot(2,2,4)
% plot(chan03_ad_data(1:sample_num),'--*b')
% grid on
%===========================================================================================================================%
%                end  data printed on PC display
%
%===========================================================================================================================%