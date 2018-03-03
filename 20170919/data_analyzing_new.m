close all;
clear all; clc;

sample_num = 25000; %画图时样本的点数


%===========================================================================================================================%
%                  SD card files
%
%===========================================================================================================================%
fid = fopen('20170913112634.wav','rb');
% fid = fopen('Counting.wav','rb');
[raw_data,num]= fread(fid,inf,'uchar');

j = 1;
for i = 1:2:num
    sample(j) = raw_data(i) + raw_data(i+1)*16^2;
    sample(j) = sample(j)*3.3/2^16;
    if(sample(j) > 5)
        sample(j) = 3.3;
    end     
%     sample(j) = sample(j)*3.3/2^16;
    j = j+1;
end

N = length(sample);



% aaa = chan00_ad_data_sd(1000:513000)';
% save afile.txt -ascii aaa;

%=========================================================================%
%                   int test
%=========================================================================%
% chan00_ad_data_sd = int32(chan00_ad_data_sd);


figure(1)
% subplot(2,2,1)
% plot(sample(100:sample_num),'--b')
% plot(sample(100:sample_num),'b')
plot(sample(1000:sample_num),'b')
title('Mic signal')
xlabel('Sample number')
ylabel('Amplitude / V')
grid on


%===========================================================================================================================%
%                 end SD card files
%
%===========================================================================================================================%


