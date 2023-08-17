function [FI,SI] = FormCirc2DC(L1,L2,C1,C2,R1,R2,Icou)
% This is the Fourier transform of ellipse
% a1 and a2 is the half side of the rectangle
% %%%

Icou2=2*Icou;
[ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);

k1m=ik1.*2*pi/L1;
k2m=ik2.*2*pi/L2;

V = L1*L2;
VI = pi* R1*R2;
eta = sqrt((R1*k1m).^2+(R2*k2m).^2);
FI = 2*VI/V*besselj(1,eta)./eta.*exp(-j*(k1m.*C1+k2m.*C2));

FI(Icou+1,Icou+1)=VI/V;
SI = VI/V;
end


%

