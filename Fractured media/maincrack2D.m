clear all;
L1= 1; L2=1; % Dimensions of unit cell

Icou =128; 
Icou2 = 2*Icou;
E1=0;
E2= 1;

niter=500;
precis = 0.001;

pos =[-0.3 0; 0.3 0];
l = [pos(2,1)-pos(1,1) pos(2,2)-pos(1,2)];
l = l/sqrt(l(1)^2+l(2)^2);
n = [-l(2) l(1)];
f = [n(1)*n(1) n(1)*n(1)];
[Pnds11]=FormPolylines(L1,L2,pos,f,Icou2);
f = [n(2)*n(2) n(2)*n(2)];
[Pnds22]=FormPolylines(L1,L2,pos,f,Icou2);
f = [n(1)*n(2) n(1)*n(2)];
[Pnds12]=FormPolylines(L1,L2,pos,f,Icou2);



[omega1,omega2,k,error]=itersolvercrack2D(E1,E2,Pnds11,Pnds12,Pnds22, Icou,niter,precis);
[R1,R2] = TensorR2D(L1,L2,Icou);

theta = R1.*omega1 + R2.* omega2;
plotFFT(theta);
