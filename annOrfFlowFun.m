function [q] = annOrfFlowFun(d,c,A,rho,dp)
% v3: Accounts for eccentricity

% A:	[m^2] Gallery flowpath Area
% d:	[m] Spool diameter
% c:	[m] Radial clearance
% rho:	[kg/m^3]	Working fluid mass density
% dp:	[Pa] Pressure differential across leakage path
% q:	[m^3/s] Volumetric flow rate

Cd = 0.62;

q1 = Cd*A*sqrt(2*abs(dp)/rho)*sign(dp);		% Flow through uncovered gallery
q2 = Cd*pi*d*c*sqrt(2*abs(dp)/rho)*sign(dp);	% Flow through annular leakage

q = max(abs(q1),abs(q2))*sign(dp);		