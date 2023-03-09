clear all
close all


w_s_vec = 500:500:6000;
N_s = 50;
N_r = N_s * 4;
w_r_vec = -1000:100:2000;

[w_s,w_r] = meshgrid(w_s_vec,w_r_vec);

w_c = (w_s*N_s + w_r*N_r)/(N_s+N_r);
R = w_s * (N_s + N_r)./(w_s*N_s + w_r*N_r);
M_e = 1;        % Torque in
P_in = M_e*w_s;     % Input power
P_r = P_in.*R.*(w_r./w_s)*N_r/(N_s+N_r);  % Power thru variator
P_r_frac = P_r./P_in;
P_s = P_in.*w_s./(w_s + N_r/N_s*w_r);
P_s_frac = P_s./P_in;
% Inifinite gear ratio is Neutral
fig1 = figure;
grid on
hold on
% surf(w_s,w_r,R);
contour(w_s,w_r,R,0:10,'ShowText','on');
xlabel('Motor Speed')
ylabel('Ring gear speed')
zlabel('Gear Ratio')
titlestr = sprintf('Gear Ratio');
title(titlestr)
zlim([-10 10])

% Plots at motor RPM of interest
RPM_int = 5200;
R_int = interp2(w_s,w_r,R,RPM_int,w_r_vec);
P_r_frac_int = interp2(w_s,w_r,P_r_frac,RPM_int,w_r_vec);
P_s_frac_int = interp2(w_s,w_r,P_s_frac,RPM_int,w_r_vec);

fig_int = figure;
fig_int.Position = [680   282   560   696];
subplot(2,1,1)
grid on
hold on
plot(w_r_vec,R_int,'linewidth',1)
xlabel('Ring gear speed')
ylabel('Gear Ratio')
titlestr = sprintf('Motor Speed: %4.0f RPM',RPM_int);
title(titlestr)
ylim([0 10])
subplot(2,1,2)
grid on
hold on
plot(R_int,P_r_frac_int,'linewidth',1)
% plot(R_int,P_s_frac_int,'linewidth',1)
xlabel('Gear Ratio')
ylabel('Power thru Variator')
% ylim([0 1])
xlim([1 10])

% fig2 = figure;
% grid on
% hold on
% % surf(w_s,w_r,P_r_frac);
% surf(w_s,R,P_r_frac);



% xlabel('Motor Speed')
% ylabel('Ring gear speed')
% zlabel('Relative Power thru Variator')
% titlestr = sprintf('Power thru Variator');
% title(titlestr)
% % zlim([0 1])
% ylim([0 10])



