clear all; clc;

% fid = fopen('d:\FCIM\channel01.txt');
% test = fscanf(fid, '%s\n');
% raw_data=textread('d:\FCIM\data22.txt','%s')';%���ַ���ʽ���ļ� 
raw_data=textread('d:\FCIM\data33.txt','%s')';%���ַ���ʽ���ļ� 
data=hex2dec(raw_data)'; %16����ת��Ϊ10������������alpha���� 
N = length(data);
j1 = 1;
j2 = 1;
j3 = 1;
j4 = 1;
for i = 1:8:N
    temp = data(i);
    if(temp > 2^31)
        temp = -(2^32 - temp);
    end
    channel_01(j1) = temp;
    j1 = j1 +1;
end

for i = 2:8:N
    temp = data(i);
    if(temp > 2^31)
        temp = -(2^32 - temp);
    end
    channel_02(j2) = temp;
    j2 = j2 +1;
end

for i = 3:8:N
    temp = data(i);
    if(temp > 2^31)
        temp = -(2^32 - temp);
    end
    channel_03(j3) = temp;
    j3 = j3 +1;
end

for i = 4:8:N
    temp = data(i);
    if(temp > 2^31)
        temp = -(2^32 - temp);
    end
    channel_04(j4) = temp;
    j4 = j4 +1;
end


% channel_01
figure (1)
% plot(channel_01,'--*r')
stem(channel_01,'fill','--');
grid on

figure (2)
plot(channel_02,'--og')
grid on

figure (3)
plot(channel_03,'--+b')
grid on

figure (4)
plot(channel_04,'--+c')
grid on












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
%         ģ������д���ı���
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
% fid01 = fopen('d:\FCIM\channel01.txt','wt');   %���ı�д�뷽ʽ���ļ�
% if(fid01 > 0)
% total_num01 = fwrite(fid01,chan01,'double');
% end 
% fclose(fid01);
% dlmwrite('d:\FCIM\channel01.txt',chan01 ,'delimiter', ' '); 
% %type channel01.txt
% chan_data01 = importdata('d:\FCIM\channel01.txt');

% 
% %  channel 02 
% fid02 = fopen('d:\FCIM\channel02.txt','wt+');   %���ı�д�뷽ʽ���ļ�
% if(fid02 > 0)
% total_num02 = fwrite(fid02,chan02,'double');
% end 
% fclose(fid02);
% 
% %  channel 03 
% fid03 = fopen('d:\FCIM\channel03.txt','w+');   %���ı�д�뷽ʽ���ļ�
% if(fid03 > 0)
% total_num03 = fwrite(fid03,chan03,'double');
% end 
% fclose(fid03);
% 
% %  channel 04 
% fid04 = fopen('d:\FCIM\channel04.txt','w+');   %���ı�д�뷽ʽ���ļ�
% if(fid04 > 0)
% total_num04 = fwrite(fid04,chan04,'double');
% end 
% fclose(fid04);

%==========================================================================
%         End   ģ������д���ı���
%==========================================================================


%==========================================================================
%         ��ȡ��FCIM�вɼ��������ı��ļ�
%==========================================================================
%type channel01.txt
% chan_data01 = importdata('d:\FCIM\channel01.txt');
% chan_data02 = importdata('d:\FCIM\channel02.txt');
% chan_data03 = importdata('d:\FCIM\channel03.txt');
% chan_data04 = importdata('d:\FCIM\channel04.txt');


% clear;clc
% %  channel 01 
% fip01=fopen('d:\FCIM\channel01.txt','rt+');
% %[SIN,num]=fread(fip,[2,20],'double');%inf��ʾ��ȡ�ļ��е��������ݣ�[M,N]��ʾ
% %[chan_data01,num01]=fread(fip01,inf,'double');
% [chan_data01,num01]=fread(fip01,inf,'int32');
% %����ȡ�����ݷ�����M��N���У�N��ʾ����ȡ�����ݷ�����1����
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
%         END ��ȡ��FCIM�вɼ��������ı��ļ�
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







