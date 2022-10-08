function [S] = TensorS2D(L1,L2,Icou)
%
Icou2=2*Icou;
[ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);

k1m=ik1.*2*pi/L1;
k2m=ik2.*2*pi/L2;
xisq = k1m.^2+k2m.^2;
S=ones(Icou2,Icou2)./xisq;
S(Icou+1,Icou+1)=0;


