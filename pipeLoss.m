clear
close all
addpath('C:\Users\alexyudell\Documents\MATLAB\Oil Properties')
addpath('H:\Modeling\General\functionFiles')

T = 20;         % [C] Design temperature
Q = [0:0.001:3]/6e4;     % [m^3/s] Design volumetric flow rate
% Q = 1/6e4;     % [m^3/s] Design volumetric flow rate

% Oil Properties
T = 80;		% [C] Operating temperature
oil = 'LTCVT';
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;
beta = 1.4e9;		% [Pa] Oil bulk modulus



% % Lubetech 20W-50  #540092
% rho = 895;
% nu40 = 173.6;
% nu100 = 18.9;
% nu_cSt = viscCalc(nu40,nu100,T);
% nu = nu_cSt/1e6;       % [m^2/s] Kinematic Viscosity  (convert from cSt)
% mu = nu*rho;	

% Circular Duct
l_duct = 0.024;    % [m] Passage length
% d_duct = 12e-3;      % [m] Duct hydraulic diameter
d_duct = 7.05e-4;      % [m] Duct hydraulic diameter

l_r = 0;			% [m] Surface roughness
A_duct = pi*d_duct^2/4;
d_hyd = d_duct;
l_r = 0;			% [m] Surface roughness

% % % Rectangular Duct
% l_duct = 0.18;    % [m] Passage length
% t_duct = 10e-3;
% w_duct = 6e-3;
% A_duct = t_duct*w_duct;
% P_duct = 2*(t_duct+w_duct);
% d_hyd = 4*A_duct/P_duct;
% l_r = 0;			% [m] Surface roughness

% Oil Properties
% oil = 'LTCVT';
% [mu,rho,nu,Cv,k] = oilData(oil,T);

% Calculations
v = Q/A_duct;			% [m/s] flow velocity
Re = rho*d_hyd*v/mu;	% Reynolds number
e = l_r/d_hyd;			% Relative roughness

% if Re < 3000
%     f = 64./Re;
% else
%     f = 0.25./(log10((e/d_hyd)/3.7 + 5.74./Re.^0.9)).^2;
% end

f = NaN(1,length(Re));
f(Re < 3000) = 64./Re(Re < 3000);
f(Re >= 3000) = 0.25./(log10((e/d_hyd)/3.7 + 5.74./Re(Re >= 3000).^0.9)).^2;		% Validated against Blasius 2/3/22 AY

dp = f*rho.*v.^2*l_duct/(2*d_hyd);
dp_psi = dp/6895;
dp_bar = dp/1e5;

if length(Re) > 1
figure
grid on
hold on
yyaxis left
plot(Q*6e4,dp_bar)
ylabel('Pressure differential (bar)')
yyaxis right
plot(Q*6e4,Re)
ylabel('Reynolds Number')
xlabel('Volumetric Flow (L/min)')


end



