clc; clear;
close all;
% find_num
%x = input('x = ');
x = 12;
%arr = fix(rand(1,20)*100);
arr = 1:20;
% arr(12) == 12
for i = 1:20
     if(arr(i) == x)
        disp('find');
        i, arr(i)
        break;
        %return i;
     else
         disp('not find');
     end
end