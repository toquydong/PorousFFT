# PorousFFT for conductivity

This is the source code for the case of circular pore in the paper

Quy-Dong To, Guy Bonnet. FFT based numerical homogenization method for porous conductive materials. Computer Methods in Applied Mechanics and Engineering, 368, 113160, 2020

Update 22/06/23: Enforce the symmetry of the operators and the Fourier transform of the physical quantities for even resolution, e.g A(1,:)=A(:,1)=0;
