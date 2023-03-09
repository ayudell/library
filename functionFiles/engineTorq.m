function [tau,P] = engineTorq(engine,N)
% Loads and interpolates oil properties.
% T must be in degrees C.

engineFolder = 'C:\Users\alexyudell\Documents\MATLAB\Engine Curves\';

% Load property file
if strcmp(engine,'372Chery')
    load(strcat(engineFolder,'372Chery.mat'))
elseif strcmp(engine,'1LDChery')
    load(strcat(engineFolder,'1LDChery.mat'))
elseif strcmp(engine,'372Chery_r')
    load(strcat(engineFolder,'372Chery_r.mat'))
end

tau = interp1q(T_N(:,1),T_N(:,2),N);        % [N-m] Calc torque at WOT given N rpm
P = tau*N*2*pi/60;                          % [W] Calc power at WOT

end
