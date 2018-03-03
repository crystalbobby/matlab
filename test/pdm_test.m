% matlab代码实现
%Sample demo for Delta modulation
sample_num=200;
n_sample=5;
x_src=0:2*pi/sample_num:n_sample*2*pi;
y_src=sin(x_src);
%y_src(i)与qe(i+1)对应,y_pdm(i)
% Delta modulation-demodulation
%len 表示采样点数
len = length(y_src);
qe(1) = 0;
for i=1:len
    if(y_src(i)>=qe(i))
        y_pdm(i)=1;
    else
        y_pdm(i)=-1;
    end
    qe(i+1)=y_pdm(i)-y_src(i)+qe(i);
end
subplot(2,1,1);plot(y_src,'r'); % red -- input
grid on
title('(red:input signal, green:sin PDM wave)');
ylabel('amplitude');
axis([0 n_sample*sample_num -1 1])
subplot(2,1,2);plot(y_pdm,'g'); % green -- output
grid on
ylabel('amplitude');
axis([0 n_sample*sample_num -1 1])