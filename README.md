# PorousFFT

Numerical homogenization for porous material using FFT method

This repository contains the Matlab source codes to solve various problems involving porous media, based on Lippmann Schwinger integral equations and Fast Fourier Transform

Homogenization is the procedure of finding the overall behavior of heterogeneous materials from their microstructures by solving the boundary value problems in a unit cell called Representative elementary volume (REV). The local behavior of the problem are characterized by Partial Differential Equations (PDE) with varying coefficients representing the heterogeneity of the material. Depending on the physics, it could be heat conduction, elasticity, plasticity or Stokes flow etc.. problems at the local scale.

Most local problems are periodic and can be formulated as Lippmann Schwinger (LS) integral equations, which are then solved by iterations. In this case, the Fast Fourier Transform (FFT) techniques are useful due to the following reasons:
- Operators in Lippmann Schwinger integral equations are convolution operators which have explicit form in Fourier space.
- The FFT algorithm is robust
- The problems are periodic and solving them on a regular grid is compatible with tomographic image input.

However, it is known that LS-FFT schemes encounter convergence issues when it comes to the case of infinite contrast, i.e a constituent material which is much stiffer (more conductive) or much softer (less conductive) than the remaining constituent. This is the case of porous materials where the void has zero stiffness, zero conductivity and infinite hydraulic conductivity (saturated porous material).

In this project, we propose different techniques to deal with infinite contrast issues. The main idea is to avoid finding solutions in the void phase and to reformulate the LS equations to find solutions in the remaining phase where the contrast is finite. As a result, in the new LS equations, the action of the void phase will be present as the distribution on the boundary, in addition to the usual volume distribution of the remaining phase. 

Another interesting feature of the new LS equations is that they can be used to solve non periodic problems. This feature is important because a large number of boundary value problems are non periodic or mixed, for example, the case of infinite plate with PBC along x, y but non periodic along z.
