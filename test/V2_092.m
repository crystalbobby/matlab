% v2_092.m   
%
% This is a script file to solve a 3 DOF system
% given the mass, damping and stiffness matrices
% in dimensionless units and plot any desired 
% frequency response function.  
             
%**********************************************************************
% Author: Randall J. Allemang
% Date:	18-Apr-94
% Structural Dynamics Research Lab
% University of Cincinnati
% Cincinnati, Ohio  45221-0072
% TEL:  513-556-2725
% FAX:  513-556-3390
% E-MAIL: randy.allemang@uc.edu
%*********************************************************************
%
clear,clc
pi=3.14159265;
plt=input('Store plots to file (Yes=1): (0)');if isempty(plt),plt=0;end;
mass=[10,0,0;0,14,0;0,0,12];
stiff=[5000,-3000,0;-3000,5500,-2500;0,-2500,4000];    
damp=[50,-30,0;-30,55,-25;0,-25,40];    
null=[0,0,0;0,0,0;0,0,0];
%    Form 2N x 2N state space equation.  
a=[null,mass;mass,damp];
b=[-mass,null;null,stiff];
[x,d]=eig(b,-a);
% Sort Modal Frequencies  
orig_lambda=diag(d);
[Y,I]=sort(imag(orig_lambda));
lambda=orig_lambda(I);
xx=x(:,I);
%     Normalize x matrix to real vectors if possible
for ii=1:6
xx(1:6,ii)=xx(1:6,ii)./xx(4,ii);
end
%     Compute 'modal a' and 'modal b' matrix
ma=xx.'*a*xx;
mb=xx.'*b*xx;
%     Extract modal vectors from state-space formulation
psi(1:3,1)=xx(4:6,1);
psi(1:3,2)=xx(4:6,2);
psi(1:3,3)=xx(4:6,3);
psi(1:3,4)=xx(4:6,4);
psi(1:3,5)=xx(4:6,5);
psi(1:3,6)=xx(4:6,6);
lambda
xxx=input('Hit any key to continue');
psi
xxx=input('Hit any key to continue');
ma
xxx=input('Hit any key to continue');
mb
xxx=input('Hit any key to continue');
%      Calculate residue matrices
A1=psi(1:3,1)*psi(1:3,1).'./ma(1,1);
A2=psi(1:3,2)*psi(1:3,2).'./ma(2,2);
A3=psi(1:3,3)*psi(1:3,3).'./ma(3,3);
A4=psi(1:3,4)*psi(1:3,4).'./ma(4,4);
A5=psi(1:3,5)*psi(1:3,5).'./ma(5,5);
A6=psi(1:3,6)*psi(1:3,6).'./ma(6,6);
resp=input('Enter response (row) DOF: (1)');if isempty(resp),resp=1;end
inp=input('Enter input (column) DOF: (1)');if isempty(inp),inp=1;end
residu(1) = A1(resp,inp);
residu(2) = A2(resp,inp);
residu(3) = A3(resp,inp);
residu(4) = A4(resp,inp);
residu(5) = A5(resp,inp);
residu(6) = A6(resp,inp);
%      Calculate desired plots
om=linspace(0,100,501);
H1=residu(1)./(j.*om-lambda(1));
H2=residu(2)./(j.*om-lambda(2));
H3=residu(3)./(j.*om-lambda(3));
H4=residu(4)./(j.*om-lambda(4));
H5=residu(5)./(j.*om-lambda(5));
H6=residu(6)./(j.*om-lambda(6));
H=H1+H2+H3+H4+H5+H6;
om(151),H(151)
om(251),H(251)
xxx=input('Hit any key to continue');
subplot(211),semilogy(om,abs(H),om(151),abs(H(151)),'*',om(251),abs(H(251)),'*')
xlabel('Frequency (Rad/Sec)'),ylabel('Magnitude'),grid
subplot(212),plot(om,angle(H),om(151),angle(H(151)),'*',om(251),angle(H(251)),'*')
xlabel('Frequency (Rad/Sec)'),ylabel('Phase'),grid
title(['FRF   Input: ',num2str(inp),'   Response: ',num2str(resp)])
pause
if plt==1,print -f1 -deps v2_092a,end;
