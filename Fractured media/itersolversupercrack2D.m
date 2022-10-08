% calcul des d�formations
%
function [src,k,error]=itersolversupercrack2D(ExdeltaL,deltaL,Icou,niter,precis)

k=1;
Icou2=2*Icou;
L1=1;
L2=1;
normnds = norm2d(ExdeltaL,Icou);


[S] = TensorS2D(L1,L2,Icou);


src = zeros(Icou2,Icou2);

res = ExdeltaL - ExdeltaL(Icou+1,Icou+1)/deltaL(Icou2+1,Icou2+1)*deltaL(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou);

p = res;

resp= res;



for iter=1:niter


[Ap]=computeAx_supercrack(deltaL,S,p);
rrold = sum(sum((res.*conj(resp))));
Aprp = sum(sum((resp.*conj(Ap))));
alpha = rrold/Aprp;
s =  res - alpha*Ap;   


if norm2d(s,Icou)/normnds< precis
    src = src + alpha*p;
    break
end
    
[As]=computeAx_supercrack(deltaL,S,s);

w = sum(sum((s.*conj(As))))/sum(sum((As.*conj(As))));
src = src+alpha*p+w*s;


res = s-w*As;


error = norm2d(res,Icou)/normnds

if (error < precis) 
break
end
rrnew = sum(sum((res.*conj(resp))));

beta = alpha/w *rrnew/rrold;
p = res + beta*(p-w*Ap);

if rrnew < 1E-6
    resp=res;
    p=res;
    end
k = k+1

end

end
