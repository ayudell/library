%% % SnumOrf.m  % %%

% Multiple Series Orifice Calculator
%
% PURPOSE:
% The code inputs a desired orifice value, d_o and N orifices in series
% that would result in the same orifice resistance as a single orifice d_o
%
% NOTES:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear

rho = 874;
Cd = 0.62;
N = 2;                      % Number of series orifices

d_o = 0.016*0.0254;         % [m] Equivalent orifice diameter desired
A_o = pi*d_o^2/4;			% [m^2] Orifice Area
A_N = A_o*sqrt(N);			% [m^2]	Area of a single orifice		
d_N = sqrt(A_N*4/pi);       % [m] Diameter of series orifices needed

d_N_in = d_N/.0254;


q = 1/6e4;                  % FLow rate through orifice series
        
dp_N = N*rho/2*(q/Cd)^2*1/A_N^2;        % Pressure drop across orifice series
dp_o = rho/2*(q/Cd)^2*1/A_o^2;          % PRessure drop across specified orifice (check)


d_Nd = d_o*N^0.25;      % Simplified formula
d_Nd_in = d_Nd/0.0254;

fprintf('\nOrifice equivalency')
fprintf('\n%1.0f orifices @ %1.3f mm (%0.3f in)',N,d_N*1000,d_N_in)
fprintf('\n1 orifice  @ %1.3f mm (%0.3fin)\n',d_o*1000,d_o/0.0254)