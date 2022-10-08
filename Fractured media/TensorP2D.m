
function [P11,P22,P12] = TensorP2D(L1,L2,Icou)
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


P11=k1.^2;
P12=k1.*k2;
P22=k2.^2;

P11(Icou+1,Icou+1)=0;
P12(Icou+1,Icou+1)=0;
P22(Icou+1,Icou+1)=0;