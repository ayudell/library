clear
close all

T_o = 20;       % Manufacturing Temp
T_max = 100;    % Max temp

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
alpha_delrin = 13.7e-5;

% _i is inner material
% _o is outer material
E_i = 100e9;            % [Pa] Young's Modulus
E_o = 3e9;
R = 2.5e-3;                    % [m] Nominal press Radius
r_i = 0e-3;                 % [m] Inner radius, inner material
r_o = 8.48/2*1e-3;                  % [m] Outer radius, outer material
v_i = 0.331;                 % [-] Poisson's Ratio
v_o = 0.35;                 
delta = 0.04e-3/2;      % [m] Radial interference

l_fit = 6.79e-3;            % [m] Axial length of fit
mu = 0.27;                      % Friction coefficient

alpha = alpha_delrin;

% % [Pa] Pressure caused by press fit (Shigley)
% p = delta/(R*(1/E_o*((r_o^2+R^2)/(r_o^2-R^2)+v_o)+ 1/E_i*((R^2 + r_i^2)/(R^2 - r_i^2)-v_i)));
% p_ksi = (p/1e6)/6.895;
% 

% From Dupont 
% http://www.dupont.com/content/dam/dupont/products-and-services/plastics-polymers-and-resins/thermoplastics/documents/General%20Design%20Principles/General%20Design%20Principles%20for%20Assembly%20Techniques%20-%20Screws,%20Press%20Fit,%20Snap-fit.pdf
W = (r_o^2 + R^2)/(r_o^2 - R^2);
p = S_y_delrin*1.5;

I_nom = p*R/W * ((W+v_o)/E_o + (1-v_i)/E_i);      % Diametral interference

% [N] Friction force at press
F_fr = p*mu*2*pi*R*l_fit;
F_ft_lbf = F_fr*0.225;

tot_tol = 0.045e-3;

I_min = I_nom - (tot_tol);
I_max = I_nom + (tot_tol);

% Calculate thermal expansion effect
R_temp = R + alpha*(T_max-T_o)*R;
I_temp = I_nom - (2*(R_temp-R)) - tot_tol;        % Worst case, min tolerance at temp

p_min = I_min/(R/W * ((W+v_o)/E_o + (1-v_i)/E_i));      % Min press pressure
p_max = I_max/(R/W * ((W+v_o)/E_o + (1-v_i)/E_i));      % Max press pressure
p_temp = I_temp/(R/W * ((W+v_o)/E_o + (1-v_i)/E_i));      % Max press pressure


F_min = p_min*mu*2*pi*R*l_fit;
F_max = p_max*mu*2*pi*R*l_fit;
F_temp = p_temp*mu*2*pi*R*l_fit;
sf_min = S_y_delrin/p_max;



fprintf('\n\n==============\n')
fprintf('RESULTS\n\n')
if F_min > 0
fprintf('Total Tolerance:                   %0.4f mm\n',tot_tol*1e3)
fprintf('Minimum Safety Factor:             %2.2f [-]\n',sf_min)
fprintf('Minimum press force:               %3.2f lbf\n',F_min*0.225)
fprintf('Minimum press force at 100C:       %3.2f lbf\n',F_temp*0.225)
fprintf('Maximum press force:               %3.2f lbf\n',F_max*0.225)
fprintf('Nominal dia. press interference:   %0.4f in    %0.4f mm\n',I_nom*1000/25.4,I_nom*1000)
else
    fprintf('ERROR: CLEARANCE AT LMC CONDITIONS\n\n')
end
fprintf('\n\n\n\n')
