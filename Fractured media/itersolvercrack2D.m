function [omega1,omega2,k,error]=itersolvercrack2D(E1,E2,Pnds11,Pnds12,Pnds22, Icou,niter,precis)

k=1;
Icou2=2*Icou;
L1=1;
L2=1;
normnds = norm2d(Pnds11+Pnds22,Icou);

[P11,P22,P12] = TensorP2D(L1,L2,Icou);

omega1 = zeros(Icou2,Icou2);
omega2 = zeros(Icou2,Icou2);

res1 = E1*Pnds11(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou)+E2*Pnds12(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou);
res2 = E1*Pnds12(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou)+E2*Pnds22(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou);
p1 = res1;
p2 = res2;
resp1= res1;
resp2=res2;


for iter=1:niter


[Ap1, Ap2]=computeAx_crack(P11,P22,P12,Pnds11,Pnds22,Pnds12,p1,p2);
rrold = sum(sum((res1.*conj(resp1)+res2.*conj(resp2))));
Aprp = sum(sum((resp1.*conj(Ap1)+resp2.*conj(Ap2))));
alpha = rrold/Aprp;
s1 =  res1 - alpha*Ap1;   
s2 =  res2 - alpha*Ap2;

if norm2d2(s1,s2,Icou)/normnds < precis
    omega1 = omega1 + alpha*p1;
    omega2 = omega2 + alpha*p2;
    break
end
    
[As1, As2]=computeAx_crack(P11,P22,P12,Pnds11,Pnds22,Pnds12,s1,s2);

w = sum(sum((s1.*conj(As1)+s2.*conj(As2))))/sum(sum((As1.*conj(As1)+As2.*conj(As2))));
omega1 = omega1+alpha*p1+w*s1;
omega2 = omega2+alpha*p2+w*s2;

res1 = s1-w*As1;
res2 = s2-w*As2;

error = norm2d2(res1,res2,Icou)/normnds
[Aomega1, Aomega2]=computeAx_crack(P11,P22,P12,Pnds11,Pnds22,Pnds12,omega1,omega2);

if (error < precis) 
break
end
rrnew = sum(sum((res1.*conj(resp1)+res2.*conj(resp2))));

beta = alpha/w *rrnew/rrold;
p1 = res1 + beta*(p1-w*Ap1);
p2 = res2 + beta*(p2-w*Ap2);
if rrnew < 1E-6
    resp1=res1;
    resp2=res2;
    p1=res1;
    p2=res2;
end
k = k+1

end

end
