function [n1,n2]=FormCircndelta(L1,L2,C1,C2,R1,R2,Icou)
% calcul du flux par la méthode de polarisation à P imposé.

%%%%% Find the normal vector, center project


Icou2=2*Icou;
% [ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);
% 
% k1m=ik1.*2*pi/L1;
% k2m=ik2.*2*pi/L2;
% 
% kb=sqrt(k1m.^2+k2m.^2);
% kb(Icou+1,Icou+1)=1;
% 
% k1=k1m./kb;
% k2=k2m./kb;
% 
% k1(Icou+1,Icou+1)=0;
% k2(Icou+1,Icou+1)=0;
% 
% % S= 2*pi*R;
% % V= L1*L2;
% % FF1 =- S/V*besselj(1,R*kb).*k1;
% % FF2 =- S/V*besselj(1,R*kb).*k2;
% V = L1*L2;
% VI =  pi*R^2;
% eta = R*kb;
% FF1 = -2*j*VI/V*k1m.*besselj(1,R*kb)./(R*kb);
% FF2 = -2*j*VI/V*k2m.*besselj(1,R*kb)./(R*kb);
[xi1,xi2] = TensorX2D(L1,L2,Icou);
 [FI,SI] = FormCirc2DC(L1,L2,C1,C2,R1,R2,Icou);
 
n1 = -j*xi1.*FI;
n2 = -j*xi2.*FI;
% n1(Icou2,:)=0;
% n2(Icou2,:)=0;
% n1(:,Icou2)=0;
% n2(:,Icou2)=0;
end
