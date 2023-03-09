function [nu_cSt] = viscCalc(nu40,nu100,T)

% % ISO46:
% nu40 = 44.2;
% nu100 = 6.7;

% % 80W-90:
% rho = 900;
% nu40 = 136;
% nu100 = 14.5;

% % AGL:
% rho = 845;
% nu40 = 42.9;
% nu100 = 7.5;

% % Mobile 424
% rho = 880;
% nu40 = 55;
% nu100 = 9.3;

% % Mobile 0W-40
% rho = 846;
% nu40 = 71;
% nu100 = 12.9;

% % Lubetech 20W-50  #540092
% rho = 895;
% nu40 = 173.6;
% nu100 = 18.9;

% % Silicone fluid 60kcSt (25C)
% rho = 977;
% VI = 0.61;
% nu40 = 45400;
% nu100 = (1-VI)*nu40;


T1 = 40  +273.15;
T2 = 100 +273.15;

T = T + 273.15;

C1 = log(log(nu40 + 0.7));
C2 = log(log(nu100 + 0.7));

[Am] = [1 -log(T1); 1 -log(T2)]\[C1;C2];

A = Am(1,1);
B = Am(2,1);

nu_cSt = exp(exp(A)/(exp(B*log(T)))) - 0.7;

% Source:
% Drews, A.W.. (1998). Manual on Hydrocarbon Analysis (6th Edition): (MNL 3). ASTM International.
% ASTM D341