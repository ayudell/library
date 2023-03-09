function [q] = valveFlowMeterFun(d,c,l,A,rho,mu,dp,e)
% v3: Accounts for eccentricity

% A:	[m^2] Gallery flowpath Area
% d:	[m] Spool diameter
% c:	[m] Radial clearance
% rho:	[kg/m^3]	Working fluid mass density
% dp:	[Pa] Pressure differential across leakage path
% q:	[m^3/s] Volumetric flow rate

Cd = 0.62;
	A_orf = pi*d*c;
	q_orf = Cd*A_orf*sqrt(2*abs(dp)/rho)*sign(dp);		% Annular flow leakage
	e_rat = e/c;
	
if l >= 0
	% Open flow
	q_main = Cd*A*sqrt(2*abs(dp)/rho)*sign(dp);	% Flow through main flowpath
	q = max(abs(q_orf),abs(q_main))*sign(dp);	
	q = (abs(q_orf)+abs(q_main))*sign(dp);	
else
	% Annular leakage flow
	q_ann = 1/12*pi*d*dp*c^3/(abs(l)*mu)*(1+1.5*e_rat^2);		% Pousille flow with eccentricity compensation
	R_ann = dp/q_ann;
	R_orf = dp/q_orf;
	q = dp/(R_ann+R_orf);
end
