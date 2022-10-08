clear all;
L1= 1; L2=1; % Dimensions of unit cell

Icou =128; 
Icou2 = 2*Icou;
E1=1;
E2= 0;

niter=5000;
precis = 0.001;
nr =1;

pos =[-0.3 0; 0.3 0];

f = -[E1*pos(1,1)+E2*pos(1,2) E1*pos(2,1)+E2*pos(2,2)];
[ExdeltaL]=FormPolylines(L1,L2,pos,f,Icou);

f = [1 1];

[deltaL]=FormPolylines(L1,L2,pos,f,Icou2);

[src,k,error]=itersolversupercrack2D(ExdeltaL,deltaL,Icou,niter,precis);
[S] = TensorS2D(L1,L2,Icou);

theta = S.*src;
plotFFT(theta);

