clear
close all

T_o = 25;       % Operating temperature

% SBF
rho = 976;      % [kg/m^3] Oil Density
Cd = 0.62;      % [-] Discharge coefficient
nu_25 = 30000;

nu = silViscFun(nu_25,T_o);
mu = nu*rho/1e6;

Cd = 0.62;

Q = [0:0.01:5] / 6e4;     % [m^3/s] Flow rate through check

% HGLV
oil = 'HGLV';
[mu,rho,nu,Cv,k] = oilData(oil,100);
Cd = 0.62;

% Diameters
d_o = 5e-3;             % Orifice diameter
d_b = d_o + 2e-3;       % Ball diameter
d_c = 8e-3;             % Channel diameter

A_o = pi*d_o^2/4;
A_b = pi*d_b^2/4;
A_c = pi*d_c^2/4;
A_th = A_c - A_b;       % Area at throat of annulus

v_o = Q/A_o;
v_c = Q/A_c;
v_an = Q/A_th;

% Reynolds number
Re_s = rho*d_o*v_c/mu;

% Q_orf = Cd*A*sqrt(2*dp/rho);
dp_o = (Q/(Cd*A_o)).^2 * rho/2;      % Orifice pressure drop



