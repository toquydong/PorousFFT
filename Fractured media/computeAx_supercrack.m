function [Ax]=computeAx_supercrack2(deltaL,S,theta)
Icou2 = size(theta,1);
Icou = Icou2/2;
Ax = convfft2(deltaL,S.*theta,'same');
Ax = Ax - Ax(Icou+1,Icou+1)/deltaL(Icou2+1,Icou2+1)*deltaL(Icou2+1-Icou:Icou2+Icou,Icou2+1-Icou:Icou2+Icou);
end