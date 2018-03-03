%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% transfer function: H(s) = 50 + s  or H(j*omiga) = 50 + j*omiga
%% 1) use Bode diagram definition to plot the Bode plot
%% 2) use matlab self-contained function to plot Bode plot
%% Bode diagram definition: (s = j*omiga, omiga = 2*pi*f)
%%          HdB = 20*log10(|H(s)|)
%%          arg = arctan(Img(H(s)/Re(H(s))
%% x axis: logf = log10(omiga)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;

%% 1) use Bode diagram definition to plot the Bode plot 
omiga = 0:0.1:10^3;
H = 50 + j.*omiga; % transfer function
dB = 20*log10(abs(H)); % amplitude
ang = atan(imag(H)./real(H))*180/pi; %phase
phase_margin = 180 - ang; % phase margin

logf = log10(omiga); % frequency with log10
% plot amplitude and phase
figure(1)
subplot(2,1,1)
plot(logf,dB);
subplot(2,1,2)
plot(logf, ang)

% Bode amplitude and phase margin
% to determine the system is stable or not
figure(2)
subplot(2,1,1)
plot(logf,dB);
subplot(2,1,2)
plot(logf, phase_margin)

%% 2) use matlab self-contained function to plot Bode plot
% syms s
% Hs = 50 + j*s;
% [mag,phase,w] = bode(sys)
g = tf([1 50],[1]);
figure(3)
bode(g)

