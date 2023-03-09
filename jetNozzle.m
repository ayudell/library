
clear
close all


% Oil Properties
T = 110;
oil = 'LTCVT';
% oil = 'LTATF';
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;

Q = 2/6e4;		% [m^3/s] Volumetric flow rate
D_h = 3e-3;			% [m] Hydraulic Diameter
A = pi*D_h^2/4;		% [m^2] Pipe flow area (round pipe)
v = Q/A;			% [m/s] Flow Velocity

Re = D_h*v*rho/mu;		% [-] Flow Reynolds number
Oh = mu/sqrt(rho*sigma*D_h);		% [-] Ohnesorge number


