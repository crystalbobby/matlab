% A=imread('oros.bmp');  
% [m,n]=size(A);  
% %������  
% fip=fopen('test.bin','wb');  
% fwrite(fip,A,'uchar');  
% fclose(fip);  
% %��ȡ����  
% fip=fopen('test.bin','rb');  
% Image=fread(fip,[m n],'uchar');  
% fclose(fip);  

img = imread('oros.bmp');  
imshow(img); 
% imfinfo('oros.bmp');
image(img);
colorbar

fft2(img)


