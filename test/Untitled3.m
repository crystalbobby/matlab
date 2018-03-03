 clear;
 clc;
 close all;
 w = logspace(-1,6,100);
 denom = (1+j*w/10) .* (1+j*w/20000);
 H = -2*j*w ./ denom;
 Hdb = 20*log10(abs(H));
 semilogx(w,Hdb)
 xlabel('frequency (rad/s)')
 ylabel ('|H(jw)| (dB)')