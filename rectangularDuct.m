clear
close all

% Oil Properties
oil = 'HGLV';
T = -20;         % [C] Design temperature
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;

% t_duct = 6e-3;
% w_duct = 6e-3;

Q = 40/6e4;     % [m^3/s] Volumetric flow rate

t_vec = 3e-3:0.5e-3:8e-3;
w_vec = 3e-3:0.5e-3:8e-3;

for i = 1:length(t_vec)
    for j = 1:length(w_vec)
        
        t_duct = t_vec(i);
        w_duct = w_vec(j);
        A_duct = t_duct*w_duct;
        P_duct = 2*(t_duct+w_duct);
        v = Q/A_duct;   % [m/s] flow velocity
        
        d_hyd = 4*A_duct/P_duct;
        
        Re = rho*d_hyd*v/mu;
        l_duct = 10e-3;     % [m] Passage length
        
        l_r = 0;        % [m] Surface roughness
        e = l_r/d_hyd;
        
        if Re < 3000
            f = 64/Re;
        else
            f = 0.25/(log10((e/d_hyd)/3.7 + 5.74/Re^0.9))^2;
        end
        
        dp = f*rho*v^2*l_duct/(2*d_hyd);
        
        Re_mat(i,j) = Re;
        dp_bar(i,j) = dp/1e5;
    end
end