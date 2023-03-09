clear
close all

r_o = 1;                                % Outer radius set to unit
r_i = r_o * linspace(0.000,1,10000);    % Inner radius as a fraction of outer radius 
t = r_o - r_i;                          % Wall thickness
% Max unitless stress, thick wall
% Max hoop stress occurs at r_i
sigma_tw = r_i.^2./(r_o^2 - r_i.^2) .* (1 + r_o^2./r_i.^2);    % Hoop stress divided by internal pressure (unitless)
% Max unitless stress, thin wall
sigma_w = (2*r_i + t)./(2*t);

% Calculate Error
sigma_e = abs(sigma_tw - sigma_w)./sigma_tw;

% Plot
figure
hold on
plot(t./(2*r_i),sigma_e*100)    % Plot error as a percent of thick wall stress
xlim([0 1])
grid on
ylabel('Thin wall assumption error (%)')
xlabel('Thickness to Diameter Ratio')
title('Maximum Hoop Stress')