%%%%% orfCalc.m  %%%%%%
% AUTHOR: Alexander Yudell
% alexyudell@team-ind.com
%
% PURPOSE:  The purpose of this code is to solve the orifice equation for either orifice diameter,
% pressure drop or orifice flow rate, given some oil properties.  In the 'Problem Parameters', leave
% a '[]' in the variable that is to be solved for.
%
% NOTES:  This file calls for oil parameters found in the oilData.m file.
% Copyright 2019, TEAM Industries
%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('H:\Modeling\General\functionFiles')

clear
close all

% Oil Properties
% oil = 'HGLV';
oil = 'LTCVT';
T = 80;         % [C] Design temperature
[mu,rho,nu,Cv,k] = oilData(oil,T);
Cd = 0.62;
g = 9.81;

Q = 1.5/6e4;         % [m^3/s] Volumetric flow rate
dP = [];      % [Pa] Pressure drop
% d = 14e-3;    % [m] Orifice length
% t = 1e-3;
% A = pi*d*t;

d = 3e-3;    % [m] Orifice diameter
A = pi*d^2/4;

% A = 6e-3*10e-3;


% N_orf = 2;

% Q = [];         % [m^3/s] Volumetric flow rate
% dP = 25e5;      % [Pa] Pressure drop
% % d = 0.050*0.0254;    % [m] Orifice diameter
% % A = pi*d^2/4;
% d = 1.0e-3;    % [m] Orifice length
% A = pi*d^2/4;
% N_orf = 1;

% Q = 15/6e4;         % [m^3/s] Volumetric flow rate
% dP = 60e5;      % [Pa] Pressure drop
% d = [];    % [m] Orifice diameter

% Q = 80/6e4;      % [m^3/s] Volumetric flow rate
% dP = [];      % [Pa] Pressure drop
% d = 0.030*.0254;			% [m] Orifice diameter
% A1 = pi*.016*.002;


if isempty(dP)
%     A = pi*d^2/4;
    dP = Q^2*rho/((Cd*A)^2*2);
    fprintf('\nSOLVE FOR PRESSURE DROP\n')
    fprintf('Flow Rate:         %2.1f L/min\n',Q*6e4)
    fprintf('Orifice Diameter:  %2.3f mm\n',d*1e3)
    fprintf('Pressure drop:     %4.2f bar\n',dP/1e5)
end

if isempty(Q)
%     A = pi*d^2/4;
    Q = Cd*A*sqrt(2*dP/rho);
    fprintf('\nSOLVE FOR FLOW RATE\n')
    fprintf('Pressure drop:     %4.2f bar\n',dP/1e5)
    fprintf('Orifice Diameter:  %2.3f mm\n',d*1e3)
    fprintf('Flow Rate:         %2.1f L/min\n',Q*6e4)
end

if isempty(d)
    A = Q/(Cd*sqrt(2*dP/rho));
    d = sqrt(4*A/pi);
    fprintf('\nSOLVE FOR ORIFICE DIAMETER\n')
    fprintf('Pressure drop:     %4.2f bar\n',dP/1e5)
    fprintf('Flow Rate:         %2.1f L/min\n',Q*6e4)
    fprintf('Orifice Diameter:  %2.3f mm\n',d*1e3)
    fprintf('Orifice Diameter:  %0.3f in\n',d/.0254)
end


