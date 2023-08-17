
function [e1,e2,k,error]=scheme_boundf(E1,E2,nds1,nds2,Icou,niter,precis);
L1=1;
L2=1;
Icou2 = 2*Icou;
[R1,R2] = TensorR2D(L1,L2,Icou);

k=1;

e1 = zeros(Icou2,Icou2) ;
e2 = zeros(Icou2,Icou2) ;
e1(Icou+1,Icou+1)=E1 ;
e2(Icou+1,Icou+1)=E2 ;



for iter=1:niter
%
e1_ant=e1;
e2_ant=e2;

 ndse = -2*(convfft2(nds1,e1_ant,'same')+convfft2(nds2,e2_ant,'same'));
 e1 = R1.*ndse;
 e2 = R2.*ndse;
 e1(Icou+1,Icou+1)=E1 ;
 e2(Icou+1,Icou+1)=E2 ;


error = norm2d2(e1-e1_ant,e2-e2_ant,Icou)/norm2d2(e1,e2,Icou)

if (error < precis) 
break
end

k = k+1

end
end
