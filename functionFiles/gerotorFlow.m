function [Q] = gerotorFlow(n)

% Q is gerotor pump flow [m^3/s]
% n is engine speed [rpm]


n = n/60;

vl_ger = 0.63;        % [in^3/rev/in] gerotor displacement per rev. per inch
l_ger = 0.562;          % [in]  gerotor thickness
V_ger = vl_ger*l_ger*1.639e-5;  % [m^3] gerotor displacement per rev
R_ger = 67/50;          % [-] Gear ratio up to gerotor
n_ger = n*R_ger;

Q = n_ger*V_ger;