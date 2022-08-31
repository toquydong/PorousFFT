function [k1m,k2m] = TensorX2D(L1,L2,Icou)
%
Icou2=2*Icou;
[ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);

k1m=ik1.*2*pi/L1;
k2m=ik2.*2*pi/L2;


