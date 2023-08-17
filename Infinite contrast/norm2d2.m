function [n2d]=norm2d2(A1,A2,Icou)
Icou2=Icou*2;
%n2d=sqrt(sum(sum(A1.^2))+sum(sum(A2.^2)));
n2d=sqrt(sum(sum(A1.*conj(A1)))+sum(sum(A2.*conj(A2))));
