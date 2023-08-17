clear all;
L1= 1; L2=1; % Dimensions of unit cell

km = 1;
ki = 1E10;


Icou =128; 
Icou2 = 2*Icou;
niter = 100;
precis = 1E-5;
E1 = 1;
E2 = 0;
nr = 2;


nds1 = zeros(nr*Icou2,nr*Icou2);
nds2 = zeros(nr*Icou2,nr*Icou2);

[n1,n2]=FormCircndelta(L1,L2,0,0,0.3,0.3,nr*Icou);


 nds1 = nds1+(ki-km)/(ki+km)*n1;% i=inclusion, j=matrix, n pointing from i(inclusion) to j (matrix).
 nds2 = nds2+(ki-km)/(ki+km)*n2;

  
[e1,e2,k,error]=scheme_boundf(E1,E2,nds1,nds2,Icou,niter,precis);

 e1r = Icou2^2*fftshift(ifftn(ifftshift(e1)));
 
surf(real(e1r),'Edgecolor','None');
view(2)
