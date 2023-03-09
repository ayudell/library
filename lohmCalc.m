clear
close all

% Source: https://leeimh.com/resource-center/lohms/
q = 0.7;        % [l/min] Flowrate
% p = 3;                % [bar] Pressure differential
K = 288;                % correction factor lpm and bar = 288
kv =  0.1;                  % Viscosity correction factor
gamma = 0.875;              % Specific gravity
L = 275;

p = gamma*(L*q/(K*kv))^2;       % [bar] Pressure differential


% q = K*kv/L * sqrt(p/gamma);     % [l/min] flow rate