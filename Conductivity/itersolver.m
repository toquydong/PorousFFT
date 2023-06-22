function [theta,k,error]=itersolver(kr,k0,E1,E2,nds1,nds2,chin, Icou,niter,precis)

k=1;
Icou2=2*Icou;
L1=1;
L2=1;

[R1,R2] = TensorR2D(L1,L2,Icou);
[xi1,xi2] = TensorX2D(L1,L2,Icou);

theta = zeros(Icou2,Icou2) ;
theta(Icou+1,Icou+1) = 0; 


for iter=1:niter
%
theta_ant=theta;

ndstheta1 = -2*convfft2(nds1,theta_ant,'same'); 
ndstheta2 = -2*convfft2(nds2,theta_ant,'same');

ndstheta1 = symfft(ndstheta1);
ndstheta2 = symfft(ndstheta2);

en1 = j*theta_ant.*xi1 + E1*chin + ndstheta1;
en2 = j*theta_ant.*xi2 + E2*chin + ndstheta2;


theta = theta_ant+kr/k0*(R1.*en1 + R2.*en2);

error = k0*norm2d((theta-theta_ant).*(xi1.^2+xi2.^2),Icou)/(kr*sqrt(E1^2+E2^2))

if (error < precis) 
break
end

k = k+1

end
%k

end
