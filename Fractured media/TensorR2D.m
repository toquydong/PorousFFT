function [R1,R2] = TensorR2D(L1,L2,Icou)
%
Icou2=2*Icou;
[ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);

k1m=ik1.*2*pi/L1;
k2m=ik2.*2*pi/L2;

kb=sqrt(k1m.^2+k2m.^2);
kb(Icou+1,Icou+1)=1;

k1=k1m./kb;
k2=k2m./kb;

k1(Icou+1,Icou+1)=0;
k2(Icou+1,Icou+1)=0;

R1=j*k1./kb;
R2=j*k2./kb;


R1(Icou+1,Icou+1)=0;
R2(Icou+1,Icou+1)=0;
