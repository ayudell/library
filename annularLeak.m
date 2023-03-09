clear
% close all

T = 100;
% Oil Properties
oil = 'LTCVT';
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;
N = 1;      % Number of parallel symmetrical leakage paths
dp = 60e5;      % Pressure delta
d_spool= 48*1e-3;       % [m] Spool diameter
% c_spool = linspace(1e-8,0.006)*.0254;      % [m] Radial clearance
% c_spool = .0005*0.0254;   % [m] Radial clearance
c_spool = 0.036*1e-3/2;   % [m] Radial clearance
l_leak = (0:0.1:10)*1e-3;         % Leakage path length
% l_leak = 0.0005;         % Leakage path length

A = pi*d_spool*c_spool;
q_orf = N*Cd*A*sqrt(2*dp/rho);        % Orifice leakage rate
q_pous = N*1/12 * pi* d_spool*dp.*c_spool.^3.*(l_leak*mu).^-1;
q_pous_ecc = 2.5*q_pous;

q_leak = min(q_orf,q_pous_ecc);

if numel(q_leak)== 1
    fprintf('\n\nRESULTS')
    fprintf('\nPressure delta:            %2.0f bar',dp/1e5)
    fprintf('\nOrifice flow:              %2.2f L/min',q_orf*6e4)
    fprintf('\nAnnular flow:              %2.2f L/min',q_pous*6e4)
    fprintf('\nEccentric Annular flow:    %2.2f L/min\n',q_pous_ecc*6e4)
    fprintf('\nExpected Leakage:          %2.2f L/min\n',q_leak*6e4)
elseif numel(c_spool) > 1
    figure
    grid on
    hold on
    plot(c_spool/0.0254,q_leak*6e4)
    xlabel('Diametral Valve Clearance (in)')
    ylabel('Leakage flow (L/min)')
    titlestr = sprintf('Valve leakage vs. Spool Clearance\nLeakage path length = %1.2f mm\nT_{oil} = %3.0f C',l_leak*1000,T);
    title(titlestr)
elseif numel(l_leak) > 1
    figure
    grid on
    hold on
    plot(l_leak*1000,q_leak*6e4)
    xlabel('Leakage Path Length (mm)')
    ylabel('Leakage flow (L/min)')
    titlestr = sprintf('Valve leakage vs. Leakage Path Lengh\nRadial Clearance = %0.4f mm\nT_{oil} = %3.0f C',c_spool*1000,T);
    title(titlestr)
	
end
