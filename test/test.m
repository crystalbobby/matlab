c='write data.txt'; %�ļ���
 fid=fopen(c,'at'); %����C�������ļ����ļ��������򴴽�
 for i=1:10
 fwrite(fid,i);         %д����
end 
fclose('all');
% �������
c='write data.txt';
fid=fopen(c,'rt');
for i=1:10
b(i)=fread(fid,1);
end
fclose('all');
b