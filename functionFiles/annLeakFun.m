function [q] = annLeakFun(d,c,mu,rho,l,dp,e)
% v3: Accounts for eccentricity

% d:	[m] Spool diameter
% c:	[m] Radial clearance
% mu:	[Pa-s] Dynamic viscosity
% rho:	[kg/m^3]	Working fluid mass density
% l:	[m] Leakage path length
% p:	[Pa] Pressure differential across leakage path
% q:	[m^3/s] Volumetric flow rate
r = d/2;
R = d/2 + c;

dp(dp<1e3) = 1e3;

Cd = 0.62;

A = pi*d*c;		% [m^2] Leakage path cross sectional area

% Manring 2205
e_rat = e/c;
q_ann = 1/12*pi*d*dp*c^3/(abs(l)*mu)*(1+1.5*e_rat^2);		% Pousille flow with eccentricity compensation
R_ann = dp/q_ann;

q_orf = Cd*A*sqrt(2*abs(dp)/rho).*sign(dp);		% Annular flow resistance
R_orf = dp/q_orf;

q = dp/(R_ann+R_orf);