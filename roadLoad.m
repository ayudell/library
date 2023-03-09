clear
% close all

% Vehicle Data
m = 1000;                   % [kg] Vehicle mass
m_wheel = 40.2*0.453592;    % [kg] Wheel mass
r_w = 29*.0254/2;        % [m] Wheel radius
p_line = 0*1e5;       % Transmission line pressure
vl_ger = 0.63;        % [in^3/rev/in] gerotor displacement per rev. per inch
l_ger = 0.562;          % [in]  gerotor thickness
V_ger = vl_ger*l_ger*1.639e-5;  % [m^3] gerotor displacement per rev
R_ger = 67/50;          % [-] Gear ratio up to gerotor
tau_brake = 1e5*0.812e-3/(2*pi*2);        % [N-m] Engine braking torque
A_proj = 34.6/10.76;        % [m^2] Frontal area
% A_proj = 3.27;        % [m^2] Frontal area
% A_proj = 24/10.76;        % [m^2] Frontal area

C_D = 0.85;               % [-] Drag coefficient

rho_air = 1.225;         % [kg/m^3] Air density
% C_r = 0.022;                % [-] Rolling coefficient
C_r = 0.25;                % [-] Rolling coefficient
g = 9.81;               % [m/s^2] Gravitational constant

% Efficiencies
eta_m = 0.985^6;        % [-] Driveline mechanical efficiency
derate_eng = 0.00;

%% Steady State Road Load

v = [0:1:80]*0.44704;       % [m/s] velocity vector
w_w = v/r_w;

F_aero = 1/2*rho_air*v.^2*C_D*A_proj;    % [N] Aero drag force
tau_aero = F_aero*r_w;
P_aero = F_aero.*v;
F_roll = C_r*m*g;
tau_roll = F_roll*r_w*ones(1,length(v));
P_roll = F_roll.*v;

P_road = P_roll + P_aero;

%% Plots
figure
grid on
hold on
plot(v/0.44704,P_aero/746,'Linewidth',2)
plot(v/0.44704,P_roll/746,'Linewidth',2)
plot(v/0.44704,(P_aero+P_roll)/746,'Linewidth',2)
xlabel('Vehicle Speed (mph)')
ylabel('Road Load (hp)')
legend('Aero Drag','Rolling Drag','Combined','Location','Northwest')
titlestr = sprintf('Road Load Power\nC_D = %1.2f    A_F = %2.1f sqft    C_r = %1.3f',C_D, A_proj*10.76, C_r);
title(titlestr)
set(gcf,'Color',[1 1 1])


% figure
% grid on
% hold on
% plot(v/0.44704,tau_aero*0.737,'Linewidth',1)
% plot(v/0.44704,tau_roll*0.737,'Linewidth',1)
% plot(v/0.44704,(tau_aero+tau_roll)*0.737,'Linewidth',1)
% xlabel('Vehicle Speed (mph)')
% ylabel('Axle Torque (ft-lbf)')
% legend('Aero Drag','Rolling Drag','Combined','Location','Northwest')
% titlestr = sprintf('Road Load Axle Torque\nC_D = %1.2f    A_F = %2.1f sqft    C_r = %1.3f',C_D, A_proj*10.76, C_r);
% title(titlestr)
% set(gcf,'Color',[1 1 1])
% 
% 



