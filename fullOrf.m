

clear
close all

% Oil Properties
T = 110;		% [C] Operating temperature
oil = 'HGLV';
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;

D_passage = 5e-3;
d_o = .030*.0254;
A_o = pi*d_o^2/4;
d = 14e-3;
A = pi*d^2/4;
v = 0.1;

Q = A*v;

t_plate = .050*.0254;

Re = rho*(Q/A_o)*d_o/mu;
DRL = D_passage*Re/t_plate;

% Only valide if Re < 10;
Cd_lam = 0.2*sqrt(Re);