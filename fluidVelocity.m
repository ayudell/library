clear
close all

addpath('\\bgydoc\users\alexyudell\Modeling\General\functionFiles')

% Initial sump conditions
T_o = 80;          % [C] Sump initial temp
% oil = 'PentosinFFL4';
oil = 'LTCVT';
[mu,rho,nu,Cv,k] = oilData(oil,T_o);     % Function that retrieves fluid data room temperature
params.mu_abs = mu;
c = 1400;		% [m/s] Sonic velocity

n_pump = 3000;
D_pump = 2*(.63*.0254^2*14.8e-3);
q = n_pump/60*D_pump;
M_ripple = 0.06;

% Passage dimensions
l = 6e-3;
w = 12e-3;
A = l*w;
D_H = 4*A/(2*(l+w));	% [m] Hydraulic diameter

q_h = q*(1+0.5*M_ripple);
q_l = q*(1-0.5*M_ripple);

v = q/A;		% Fluid velocity
v_h = q_h/A;		% Fluid velocity
v_l = q_l/A;		% Fluid velocity
Re = rho*D_H*v/mu;

v_fps = v/.0254/12;

% Caluclate jukowski pressure
dv = v_h-v_l;
p_juk = -rho*c*dv;

