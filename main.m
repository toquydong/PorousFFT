clear all;
L1= 1; L2=1; % Dimensions of unit cell
R = 0.3;
kr =1;
k0 = 1.2;

Icou =128; 
Icou2 = 2*Icou;
niter = 100;
precis = 0.001;
E1 = 1;
E2 = 0;

chin = zeros(Icou2,Icou2);
[chin,SI] = FormCirc2DC(L1,L2,0,0,R,R,Icou);

chin = - chin;
chin(Icou+1,Icou+1)=1-SI;

[nds1,nds2,SI] = FormCircRing2DC(L1,L2,0,0,R,2*Icou);

[theta,k,error]=itersolver(kr,k0,E1,E2,nds1,nds2, chin, Icou,niter,precis);

plotFFT(theta);

colorbar;



