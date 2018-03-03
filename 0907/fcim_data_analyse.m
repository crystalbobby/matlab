close all;
clear all; clc;

% fid = fopen('d:\FCIM\channel01.txt');
% test = fscanf(fid, '%s\n');
% raw_data=textread('d:\FCIM\data22.txt','%s')';%以字符形式打开文件 
raw_data=textread('C:\Users\bobby\Documents\MATLAB\0907\print','%s')';%以字符形式打开文件 
data=int32(hex2dec(raw_data))'; %16进制转化为10进制数，存入alpha矩阵 
N = length(data);
j1 = 1;
j2 = 1;
j3 = 1;
j4 = 1;

%========================================================================%
%             将数据按通道号分组
%========================================================================%
j0 = 1; j1 = 1; j2 = 1; j3 = 1;
for j = 1:N
    if(rem(data(j),16) == 0 || rem(data(j),16) == 4 || rem(data(j),16) == 8 || rem(data(j),16) == 12 )  % channel 00
        channel_01(j0) = data(j);
         j0 = j0+1;
    else if(rem(data(j),16) == 1 || rem(data(j),16) == 5 || rem(data(j),16) == 9 || rem(data(j),16) == 13)  % channel 01
         channel_02(j1) = data(j);
         j1 = j1+1;
        else if(rem(data(j),16) == 2 || rem(data(j),16) == 6 || rem(data(j),16) == 10 || rem(data(j),16) == 14)  % channel 02
                channel_03(j2) = data(j);
                j2 = j2+1;
           else if(rem(data(j),16) == 3 || rem(data(j),16) == 7 || rem(data(j),16) == 11 || rem(data(j),15) == 15)  % channel 03
                channel_04(j3) = data(j);
                j3 = j3+1;
               end
            end
        end
    end
end


% for i = 1:8:N
%     temp = data(i);
%     if(temp > 2^31)
%         temp = -(2^32 - temp);
%     end
%     channel_01(j1) = temp;
%     j1 = j1 +1;
% end
% 
% for i = 2:8:N
%     temp = data(i);
%     if(temp > 2^31)
%         temp = -(2^32 - temp);
%     end
%     channel_02(j2) = temp;
%     j2 = j2 +1;
% end
% 
% for i = 3:8:N
%     temp = data(i);
%     if(temp > 2^31)
%         temp = -(2^32 - temp);
%     end
%     channel_03(j3) = temp;
%     j3 = j3 +1;
% end
% 
% for i = 4:8:N
%     temp = data(i);
%     if(temp > 2^31)
%         temp = -(2^32 - temp);
%     end
%     channel_04(j4) = temp;
%     j4 = j4 +1;
% end
%=========================================================================%
%      打印出的数据有超过32位的，替换成小的，方法不严谨，凑合使用
%=========================================================================%
% maxValPos01=find(channel_01==max(channel_01));
% channel_01(maxValPos01) = channel_01(maxValPos01-1);
% 
% maxValPos02=find(channel_02==max(channel_02));
% channel_02(maxValPos02) = channel_02(maxValPos02-1);
% 
% maxValPos03=find(channel_03==max(channel_03));
% channel_03(maxValPos03) = channel_03(maxValPos03-1);
% 
% maxValPos04=find(channel_04==max(channel_04));
% channel_04(maxValPos04) = channel_04(maxValPos04-1);

figure (1)
plot(channel_01)
grid on

figure (2)
plot(channel_02)
grid on

figure (3)
plot(channel_03)
grid on

figure (4)
plot(channel_04)
grid on


% channel_01
% figure (1)
% % plot(channel_01,'--*r')
% % stem(channel_01,'fill','--');
% grid on
% 
% figure (2)
% plot(channel_02,'--og')
% grid on
% 
% figure (3)
% plot(channel_03,'--+b')
% grid on
% 
% figure (4)
% plot(channel_04,'--+c')
% grid on












% chan01 = 0:255;
% chan02 = 255:-1:0;
% chan03 = 100:355;
% chan04 = 355:-1:100;
% 
% chan01_length = length(chan01);
% 
% for i = 1 : chan01_length
%     chan01(i) = 255*sin(2*pi*i/chan01_length);
% end

%==========================================================================
%         模拟数据写入文本中
%==========================================================================
% % %  channel 01 
% dlmwrite('d:\FCIM\channel01.txt',chan01 ,'delimiter', ' '); 
% %type channel01.txt
% % %  channel 02
% dlmwrite('d:\FCIM\channel02.txt',chan02 ,'delimiter', ' '); 
% % %  channel 03 
% dlmwrite('d:\FCIM\channel03.txt',chan03 ,'delimiter', ' '); 
% %type channel01.txt
% % %  channel 04
% dlmwrite('d:\FCIM\channel04.txt',chan04 ,'delimiter', ' '); 


% %  channel 01 
% fid01 = fopen('d:\FCIM\channel01.txt','wt');   %以文本写入方式打开文件
% if(fid01 > 0)
% total_num01 = fwrite(fid01,chan01,'double');
% end 
% fclose(fid01);
% dlmwrite('d:\FCIM\channel01.txt',chan01 ,'delimiter', ' '); 
% %type channel01.txt
% chan_data01 = importdata('d:\FCIM\channel01.txt');

% 
% %  channel 02 
% fid02 = fopen('d:\FCIM\channel02.txt','wt+');   %以文本写入方式打开文件
% if(fid02 > 0)
% total_num02 = fwrite(fid02,chan02,'double');
% end 
% fclose(fid02);
% 
% %  channel 03 
% fid03 = fopen('d:\FCIM\channel03.txt','w+');   %以文本写入方式打开文件
% if(fid03 > 0)
% total_num03 = fwrite(fid03,chan03,'double');
% end 
% fclose(fid03);
% 
% %  channel 04 
% fid04 = fopen('d:\FCIM\channel04.txt','w+');   %以文本写入方式打开文件
% if(fid04 > 0)
% total_num04 = fwrite(fid04,chan04,'double');
% end 
% fclose(fid04);

%==========================================================================
%         End   模拟数据写入文本中
%==========================================================================


%==========================================================================
%         读取从FCIM中采集的数据文本文件
%==========================================================================
%type channel01.txt
% chan_data01 = importdata('d:\FCIM\channel01.txt');
% chan_data02 = importdata('d:\FCIM\channel02.txt');
% chan_data03 = importdata('d:\FCIM\channel03.txt');
% chan_data04 = importdata('d:\FCIM\channel04.txt');


% clear;clc
% %  channel 01 
% fip01=fopen('d:\FCIM\channel01.txt','rt+');
% %[SIN,num]=fread(fip,[2,20],'double');%inf表示读取文件中的所有数据，[M,N]表示
% %[chan_data01,num01]=fread(fip01,inf,'double');
% [chan_data01,num01]=fread(fip01,inf,'int32');
% %将读取的数据放置在M行N列中，N表示将读取的数据放置在1列中
% fclose(fip01);
% 
% %  channel 02
% fip02=fopen('d:\FCIM\channel02.txt','rt+');
% [chan_data02,num02]=fread(fip02,inf,'double');
% fclose(fip02);
% 
% %  channel 03
% fip03=fopen('d:\FCIM\channel03.txt','rt+');
% [chan_data03,num03]=fread(fip03,inf,'double');
% fclose(fip03);
% 
% %  channel 04
% fip04=fopen('d:\FCIM\channel04.txt','rt+');
% [chan_data04,num04]=fread(fip04,inf,'double');
% fclose(fip04);

%==========================================================================
%         END 读取从FCIM中采集的数据文本文件
%==========================================================================
% chan_data01
% chan_data02
% chan_data03
% chan_data04
% plot(chan_data01,'ob')
% hold on
% plot(chan_data02,'*g')
% hold on
% plot(chan_data03,'or')
% hold on
% plot(chan_data04,'+c')
% grid on







