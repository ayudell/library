function [mu] = viscoCalcISO46(T)

T1 = 40  +273.15;
T2 = 100 +273.15;
mu_T1 = 44.2;
mu_T2 = 6.7;

C1 = log(log(mu_T1 + 0.7));
C2 = log(log(mu_T2 + 0.7));

[Am] = [1 -log(T1); 1 -log(T2)]\[C1;C2];

A = Am(1,1);
B = Am(2,1);

T = T +273.15;

mu = exp(exp(A)/(exp(B*log(T)))) - 0.7;
mu = mu/1000;


% Source: 
% Drews, A.W.. (1998). Manual on Hydrocarbon Analysis (6th Edition): (MNL 3). ASTM International. 
% ASTM D341