clear
close all

dp = 3e5;

T = 20;         % [C] Design temperature
Q = 40/6e4;     % [m^3/s] Volumetric flow rate
d = 5e-3;       % Duct hydraulic diameter
l_r = 0;        % [m] Surface roughness
Cd = 0.62;

l = linspace(0,0.01,100);

A = pi*d^2/4;


% Oil Properties
% oil = 'HGLV';
% [mu,rho,nu,Cv,k] = oilData(oil,T);
% Cd = 0.62;

rho = 975;
nu = 30000/1e6;

mu = nu*rho;

% Calculations
v = Q/A;   % [m/s] flow velocity

e = l_r/d;      % Relative roughness

Q_fric = dp*pi*d^4./(128*mu*l);
Q_orf = Cd*A*sqrt(2*dp/rho);
Re = 4*rho*Q.*l/(pi*d^2*mu);  % Reynolds number

dp_psi = dp/6895;
dp_bar = dp/1e5;

figure
grid on
hold on
plot(l*1000,Q_fric*6e4)
plot([min(l),max(l)]*1000,[Q_orf, Q_orf]*6e4)
xlabel('Pipe Length (mm)')
ylabel('Flow Rate (L/min)')