

clear
close all

eng = 'RZR1000_NA';
eng = 'Ranger1000';

load(eng)

fig1 = figure;
fig1.Color = [1 1 1];
grid on
hold on
plot(T_N(:,1),T_N(:,2))
xlabel('Engine Speed (rpm)')
ylabel('100% Torque (Nm)')
ylim([40 1.1*max(T_N(:,2))])
titlestr = sprintf(strcat(eng, ' Peak Crank Torque'));
title(titlestr)
