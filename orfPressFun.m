function [dp] = orfPressFun(A,rho,q)
% v3: Accounts for eccentricity

% A:	[m^2] Flowpath Area
% rho:	[kg/m^3]	Working fluid mass density
% dp:	[Pa] Pressure differential across leakage path
% q:	[m^3/s] Volumetric flow rate

Cd = 0.62;

dp = 1/2*(q/(Cd*A))^2*rho;

