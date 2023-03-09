
clear
close all

K_t = 1.7;		% Stress multiplier per Juvinall

d = 0.6160*0.0254;		% Shaft diameter
T = 20;			% [Nm] Shaft torque

J = pi*(d/2)^4/2;
tau = T*(d/2)/J*K_t;