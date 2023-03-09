clear
close all

% Oil Properties
T = 40;		% [C] Operating temperature
oil = 'LTCVT';
[mu,rho,nu,Cv,k] = oilData(oil,T);
dp = 20e5;
c = 0.001*0.0254;
d = 14e-3;
rho = 846;
e = 0;

x = [-0.2:0.0001:2]'*1e-3;

% Metering notch area profile

% Triangular notch in vlve block
w_notch = 2e-3;
h_notch = 1.5e-3;
N_notch = 2;

% Angled cuts in valve land
theta = 80*pi/180;
h_notch  = 1e-3;
w_notch =1e-3;
N_notch = 4;


% Variable Area
for i = 1:length(x)
	A(i) = pi*d*x(i);		% [m^2] Main flowpath area
	
% 	A2(i) = A(i) - pi*d*h_notch + 2*1/2*w_notch*h_notch;  % Notch cut in block
	A2(i) = A(i) - pi*d*h_notch + N_notch*(h_notch*sin(theta) + c)*w_notch;
	
	if x(i) < h_notch
% 		A2(i) = N_notch* 1/2*w_notch/h_notch * x(i)^2;		% land uncovering 2 opposed triangular notches
		A2(i) = N_notch*(x(i)*sin(theta) + c)*w_notch;		% Land uncovering angled notches in spool
	end
	
	q(i,1) = valveFlowMeterFun(d,c,x(i),A(i),rho,mu,dp,e);
	q2(i,1) = valveFlowMeterFun(d,c,x(i),A2(i),rho,mu,dp,e);
end

figure
grid on
hold on
plot(x*1e3,q*6e4)
plot(x*1e3,q2*6e4)
ylim([0 20])
xlim([0 2])
