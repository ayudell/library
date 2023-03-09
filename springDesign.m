
% OD, k_s, 

G = 79e9;       % [Pa] Music wire torsion modulus

D_m = OD - d;

OD_exp = sqrt(D_m^2 + (p^2 - d^2)/pi^2) + d - OD;

C = D_m/d;      % Spring index, should be between 5 and 12

% L_f = p*N_a + d;          % Free length, plain
% L_f = p*N_a;              % Free length, plain ground
% L_f = p*N_a + 3*d;        % Free length, squared
L_f = p*N_a + 2*d;          % Free length, squared and ground

% L_s = d*N_a + d:            % Solid length, plain
% L_s = d*N_a:                % Solid length, plain ground
% L_s = d*N_a + 3*d:          % Solid length, squared
L_s = d*N_a + 2*d:          % Solid length, squared and ground

LF = 0.405;     % Light service, up to 10k cycles, slow loading rate
LF = 0.324;     % Average service, up to 1e6 cycles
LF = 0.263;     % Severe Service, greater than 1e6 cycles, possibility of shock

J = pi*d^4/32;      % Polar moment of inertia
T = F*D_m/2;          % Maximum torque load in wire

K_w = (4*C-1)/(4*C-4) + 0.615/C;      % Wahl factor, accounts for coil curvature (should be between 1 and 2)

S_u = LF*Q/(d)^x;               % Allowable stress
S_s = K_w*T*(d/2)/J;            % Torsional Shear stress

S_rat = S_s/S_u;            % Ratio of spring stress to allowable stress

