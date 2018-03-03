close all;
clear all; clc;

input_range = 10; %默认输入范围为10V

fid1 = fopen('C:\Users\bobby\Documents\MATLAB\0908_1\channel_1','rb');
[raw_data1,num1]= fread(fid1,inf,'uchar');
raw_data1 = int32(raw_data1);

fid2 = fopen('C:\Users\bobby\Documents\MATLAB\0908_1\channel_2','rb');
[raw_data2,num2]= fread(fid2,inf,'uchar');
raw_data2 = int32(raw_data2);

fid3 = fopen('C:\Users\bobby\Documents\MATLAB\0908_1\channel_3','rb');
[raw_data3,num3]= fread(fid3,inf,'uchar');
raw_data3 = int32(raw_data3);

fid4 = fopen('C:\Users\bobby\Documents\MATLAB\0908_1\channel_4','rb');
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
plot(chan00_ad_data)
grid on

figure(2)
plot(chan01_ad_data)
grid on

figure(3)
plot(chan02_ad_data)
grid on

figure(4)
plot(chan03_ad_data)
grid on


% subplot(2,2,1)
% plot(chan00_data)
% grid on
% subplot(2,2,2)
% plot(chan01_data)
% grid on
% subplot(2,2,3)
% plot(chan02_data)
% grid on
% subplot(2,2,4)
% plot(chan03_data)
% grid on



% j1 = 1; j2 = 1; j3 = 1; j4 = 1;
% for j = 1:4: N
%     chan01_data(j1) = data(j);
%     j1 = j1+1;
% end
% 
% for j = 2:4: N
%     chan02_data(j2) = data(j);
%     j2 = j2 + 1;
% end
% 
%     
% 
% for j = 3:4: N
%     chan03_data(j3) = data(j);
%     j3 = j3 + 1;
%     
% end
% 
% for j = 4:4: N
%     chan04_data(j4) = data(j);
%     j4 = j4 + 1;
%     
% end

% figure (1)
% plot(chan01_data,'--og')
% grid on
% 
% figure (2)
% plot(chan02_data,'--+b')
% grid on
% 
% figure (3)
% plot(chan03_data,'--+c')
% grid on
% 
% figure (4)
% plot(chan04_data,'--+c')
% grid on


    
    
    



% for i=1:32
% a(i) = dec2hex(SIN(i))
% end
%从数据文件读取一维数据?
% fip=fopen('C:\binary3.bin','rb');?
% [SIN,num]=fread(fid,[4,inf],'double');%inf表示读取文件中的所有数据，[M,N]表示?%将读取的数据放置在M行N列中，N表示将读取的数据放置在1列中?
% test = fscanf(fid, '%s\n');
% data=hex2dec(test)'; %16进制转化为10进制数，存入alpha矩阵
% raw_data=textread('d:\FCIM\data22.txt','%s')';%以字符形式打开文件 
% raw_data=textread('d:\FCIM\data33.txt','%s')';%以字符形式打开文件 
% data=hex2dec(raw_data)'; %16进制转化为10进制数，存入alpha矩阵 
% N = length(data);
% stem(data)
