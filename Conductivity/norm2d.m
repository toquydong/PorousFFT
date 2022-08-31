function [n2d]=norm2d(A,Icou)
Icou2=Icou*2;
%n2d=sqrt(sum(sum(A.^2)));
n2d=sqrt(sum(sum(A.*conj(A))));
