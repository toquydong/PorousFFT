function [sf]=FormPolylines(L1,L2,pos,f,Icou)

Icou2=2*Icou;
[ik1,ik2]=meshgrid(-Icou:Icou-1,-Icou:Icou-1);

k1m=ik1.*2*pi/L1;
k2m=ik2.*2*pi/L2;

[rows columns] = size(pos);
J = rows;
sf = zeros(Icou2,Icou2);

for k =1:J-1
    R = (pos(k+1,:) + pos(k,:))/2;
    E = (pos(k+1,:) - pos(k,:))/2;
    a = (f(k+1) - f(k))/2;
    b = (f(k+1) + f(k))/2;    
    L = sqrt(E(1)*E(1)+E(2)*E(2));
    XE = k1m.*E(1)+k2m.*E(2);
    XR = k1m.*R(1)+k2m.*R(2);
    
     ds = j*a*(cos(XE)-sinc(XE))./XE+b*sinc(XE);
     ds(XE==0)=b;

    sf = sf + 2*L*ds.*exp(-j*XR);


end

S = L1*L2;

sf = sf/S;

end
