c='write data.txt'; %文件名
 fid=fopen(c,'at'); %打开以C命名的文件，文件不存在则创建
 for i=1:10
 fwrite(fid,i);         %写操作
end 
fclose('all');
% 读程序段
c='write data.txt';
fid=fopen(c,'rt');
for i=1:10
b(i)=fread(fid,1);
end
fclose('all');
b