%  ����������  
%  20�������ֳ����飬Ҫ���������ĺ͵Ĳ�ֵ��С��  
  
% �������  
% 1.  ����������������  
% 2.  OrderMax1�ŵ�һ�飬OrderMax2�ŵڶ��飻  
% 3.  ����ȡ�������ں���С��һ�飻  
% 4.  �ظ�3.  
  
clc;  %�������  
clear all;%�������  
close all;%�ر�ͼƬ  
  
FirstGroup=[];  
SecondGroup=[];  
  
BagNumberPoints=[38,82,54,36,94,88,56,63,59,21,31,48,24,85,20,23,18,23,44,32];  
  
% 1.  ����������������  
BagNumberPointsOrder= fliplr(sort(BagNumberPoints));  
  
% 2.  OrderMax1�ŵ�һ�飬OrderMax2�ŵڶ��飻  
FirstGroup=BagNumberPointsOrder(1);  
SecondGroup=BagNumberPointsOrder(2);  
  
% 3.  ����ȡ�������ں���С��һ�飻  
for FlagTemp=3:length(BagNumberPointsOrder)%FlagTempΪ��ʱ��־  
        if(sum(FirstGroup)>sum(SecondGroup))  
            SecondGroup=[SecondGroup,BagNumberPointsOrder(FlagTemp)];  
        else  
            FirstGroup=[FirstGroup,BagNumberPointsOrder(FlagTemp)];  
        end  
end  
  
disp('�������ĺͷֱ�Ϊ��');  
[sum(FirstGroup);sum(SecondGroup)]  
  
disp('��һ��Ϊ');  
FirstGroup  
disp('�ڶ���Ϊ');  
SecondGroup  
FirstGroup 