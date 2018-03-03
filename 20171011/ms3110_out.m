close all;
clear all;clc;

CS2INp = 2.1;
CS2p = 0.7; % 0~1.2pF

CS1INp = 2;
CS1p = 0.8; % 0~9.7pF

if( CS1INp<0.25||CS1INp>10 || CS2INp<0.25||CS2INp>10 )
    error('Invalid input capacity!');
end

CS2IN = CS2INp*10^(-12);
CS2 = CS2p*10^(-12); % F

CS1IN = CS1INp*10^(-12);
CS1 = CS1p*10^(-12); % F

CS2T = CS2IN + CS2;
CS1T = CS1IN + CS1;


GAIN = 2; % 2 or 4V/V nominal
V2P25 = 2.25; %2.25 VDC nominal
  
CF = 1.5*10^(-12); % CF ¡Ý 1.5pF is selected to optimize for input sense capacitance range
% VREF can be set to 0.5V or 2.25V DC for ¦¤CS= CS2T-CS1T =0. For 0.5V DC,
% the dynamic sensor capacity is constrained by CS2T greater or equal to CS1T.
Delta_CS = CS2T - CS1T;
% if ( Delta_CS > 0 )
%      VREF = 0.5; %VDC
% else if ( abs(Delta_CS) <eps ) % Delta_CS == 0
%      %VREF = 0.5; %VDC
%      VREF = 2.25; %VDC
%     else
%         error('CS2T should be bigger than CS1T!');
%     end
% end
VREF = 2.25; %VDC

VO = GAIN * V2P25 * 1.14 * (CS2T - CS1T)/CF + VREF; %VO is the output Voltage
if(VO<0.5 || VO >4)
    error('Invalid output');
else
    VO
end

   
