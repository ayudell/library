function [eta_v] = etaVGerotor(n,T,p)

% eta_v is gerotor pump flow volumetric efficiency [-]
% n is engine speed [rpm]
% T is temperature (C)
% p is pressure [Pa]

% Volumetric Efficiency
p_vec = [11e5,16e5];

if p < 9e5 || p > 20e5
    warning('Pressure out of range for accurate eta_v interpolation')
end
p = max(min(p,16e5),11e5);

if T < 15 || T > 100
    warning('Temperature out of range for accurate eta_v interpolation')
end
T = max(min(T,100),30);

load('11barData')
eta_v(:,1) = interp2(T_grid,n_grid,eta_v_grid,T,n);
load('16barData')
eta_v(:,2) = interp2(T_grid,n_grid,eta_v_grid,T,n);
eta_v = interp1(p_vec,eta_v,p);