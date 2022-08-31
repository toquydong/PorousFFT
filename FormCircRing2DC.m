function [FF1,FF2,FF]=FormCircRing2DC(L1,L2,C1,C2,R,Icou)

%% C1, C2 is the center of the circle, R the radius
%% 

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


V = L1*L2;
VI =  pi*R^2;
eta = R*kb;


 FF1 = -2*pi*R*j/V*k1.*besselj(1,R*kb).*exp(-j*(k1m.*C1+k2m.*C2));
 FF2 = -2*pi*R*j/V*k2.*besselj(1,R*kb).*exp(-j*(k1m.*C1+k2m.*C2));
 FF = 2*pi*R/V.*besselj(0,R*kb).*exp(-j*(k1m.*C1+k2m.*C2));


end
