close all;
clear all; clc;

sample_num = 500; %画图时样本的点数

input_range = 10; %默认输入范围为10V


%===========================================================================================================================%
%                  data printed on PC display
%
%===========================================================================================================================%

raw_data=textread('data1234_print1010_4in8_no3','%s')';%以字符形式打开文件 
data=hex2dec(raw_data)'; %16进制转化为10进制数，存入alpha矩阵 
N = length(data);

%========================================================================%
%             将数据按通道号分组
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

chan00_ad_data = double(channel_01)/2^31;
chan01_ad_data = double(channel_02)/2^31;
chan02_ad_data = double(channel_03)/2^31;
chan03_ad_data = double(channel_04)/2^31;

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


% figure (5)
figure
subplot(2,2,1)
plot(chan00_ad_data(1:sample_num),'--*b')
grid on

% figure (6)
subplot(2,2,2)
plot(chan01_ad_data(1:sample_num),'--*b')
grid on

% figure (7)
subplot(2,2,3)
plot(chan02_ad_data(1:sample_num),'--*b')
grid on

% figure (8)
subplot(2,2,4)
plot(chan03_ad_data(1:sample_num),'--*b')
grid on
%===========================================================================================================================%
%                end  data printed on PC display
%
%===========================================================================================================================%