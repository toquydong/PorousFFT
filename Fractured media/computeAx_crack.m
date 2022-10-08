function [Ax1,Ax2]=computeAx_crack(P11,P22,P12,Pnds11,Pnds22,Pnds12,omega1,omega2)
Pomega1 = P11.*omega1+P12.*omega2;
Pomega2 = P12.*omega1+P22.*omega2;
Ax1 = convfft2(Pnds11,Pomega1-omega1,'same')+convfft2(Pnds12,Pomega2-omega2,'same');
Ax2 = convfft2(Pnds12,Pomega1-omega1,'same')+convfft2(Pnds22,Pomega2-omega2,'same');
end