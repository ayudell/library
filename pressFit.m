clear
close all


E_brass = 100e9;        % [Pa]
E_steel = 200e9;
E_Al = 70e9;
E_delrin = 3e9;

S_y_delrin = 72e6;     % [Pa]

v_delrin = 0.35;
v_brass = 0.331;
v_Al = 0.35;
v_steel = 0.3;

mu_del_brass = 0.27;

% _i is inner material
% _o is outer material
E_i = 100e9;            % [Pa] Young's Modulus
E_o = 3e9;
R = 2.5e-3;                    % [m] Nominal Radius
r_i = 0e-3;                 % [m] Inner radius, inner material
r_o = 8.16/2*1e-3;                  % [m] Outer radius, outer material
v_i = 0.331;                 % [-] Poisson's Ratio
v_o = 0.35;                 
delta = 0.04e-3/2;      % [m] Radial interference

l_fit = 6.79e-3;            % [m] Axial length of fit
mu = 0.27;                      % Friction coefficient

% [Pa] Pressure caused by press fit
p = delta/(R*(1/E_o*((r_o^2+R^2)/(r_o^2-R^2)+v_o)+ 1/E_i*((R^2 + r_i^2)/(R^2 - r_i^2)-v_i)));
p_ksi = (p/1e6)/6.895;

% [N] Friction force at press
F_fr = p*mu*2*pi*R*l_fit;
F_ft_lbf = F_fr*0.225;





