

clear
% close all
addpath('H:\Modeling\General')
%% CREATE MAP
% rpm_vec = NaN(1,12);
% tp_vec = NaN(11,1);
% [tpq,nq] = meshgrid(tp_vec,rpm_vec);
% tau_arr = NaN(size(nq));
% save('defaultMap')

%% Throttle Tune
% v_tun =		[5	 10  15  20  25  30   35   40   45   50   55   60   70   75]'*0.447;			% [m/s] Vehicle speed points
% P_tun =		[0.7 1.6 2.9 4.7 7.1 10.5 15.0 20.6 27.7 36.4 46.9 59.2 90.6 109.9]'*746;		% [W] Power at crank to move v_vec
% tp_tun = NaN(length(v_vec),1);
% save('tune1','v_tun','P_tun','tp_tun')

load('tune1')

% PLOT THROTTLE MAPS
		   %[5	 10  20  30   40   50   60   70]; mph
P_tun =		[0.7 1.6 4.7 10.5 20.6 36.4 59.2 90.6 ]'*746;		% [W] Power at crank to move v_vec



%% PLOT

% load('RZR1000NA_map')
% load('RNGR1000PERF_map')
P_arr = tau_arr.*nq*2*pi/60;

% F = griddedInterpolant(tpq,nq,P_arr);
% F = griddedInterpolant(P_arr,tpq,nq);
% 
% for i = 1:length(tp_tun)
% 	rpm_tun(i) = interp2(P_arr,tpq,nq,P_tun(i),tp_tun(i));
% end

tp_map = [0 1 2 4 6 8 10 20 30 40 50 60 70 80 90 100];
v_map = [0 1 3 5 10 20 30 40 50 60 70 80];
% [TP_map,V_map] = meshgrid(tp_map,v_map);

rpm_map = NaN(length(tp_map),length(v_map));

% save('map1','tp_map','v_map','rpm_map')

load('map1')
pVec = [4:11];
[V_map,TP_map] = meshgrid(v_map,tp_map);


figure
grid on
hold on
surf(nq,tpq,tau_arr)
xlabel('Engine Speed (rpm)')
ylabel('Throttle Position (%)')
zlabel('Torque (Nm)')
title('Torque Map - RZR')
figPos(1,1,1)

fig2 = figure;
fig2.Position = [-1145         314        1001         666];
grid on
hold on
surf(nq,tpq,P_arr/746)
% contour(nq,tpq,P_arr/746,-30:10:110,'ShowText','on')
% [K,h] = contour(nq,tpq,P_arr/746,P_tun/746,'ShowText','off');
xlabel('Engine Speed (rpm)')
ylabel('Throttle Position (%)')
zlabel('Power (hp)')
title('Power Map - RZR')
% figPos(1,2,1)


% Pick coordinates of each contour
iC = 1;
idxC = 1;
while iC < size(K,2)
  nP = K(2,iC); % number of points in current contour
  xC{idxC} = K(1,iC+(1:nP)); % x coordinates of current contour
  yC{idxC} = K(2,iC+(1:nP)); % y coordinates of current contour
  iC = iC+nP+1;    % Start-point of next contour
  idxC = idxC + 1; % next contourline index
  % plot(xC{idxC-1},yC{idxC-1},'b.-') %% If you want to look at the separate
  % pause                             %% segments as they are separated.
end

for i = 1:length(pVec)
	[int_rpm(i) int_tp(i)] = intersections(rpm_map(:,pVec(i)),TP_map(:,pVec(i)),xC{i},yC{i});
end


% Power and Pedal Map Overlay
fig3 = figure;
ax3 = axes;
grid on
hold on
for i = 1:length(xC)
	plot(xC{i},yC{i},'linewidth',1)
end
set(ax3,'colorOrderIndex',1)
plot(rpm_map(:,pVec),TP_map(:,pVec),'linewidth',1)
plot(int_rpm,int_tp,'ko-','linewidth',2)
xlabel('Engine Speed (rpm)')
ylabel('Throttle Position (%)')
zlabel('Power (hp)')
title('Power and Pedal Map - RZR')
legend(strcat(num2str(v_map(pVec)'),' mph'))
figPos(2,4,2)

fig4  = figure;
grid on
hold on
yyaxis left
plot(v_map(pVec),int_rpm)
ylabel('Engine Speed (rpm)')
yyaxis right
plot(v_map(pVec),int_tp)
ylabel('Throttle Position (%)')
xlabel('Wheel Speed (mph)')
%% Load Existing Throttle map

% v_map =		[5	 10  15  20  25  30   35   40   45   50   55   60   70   75]'*0.447;			% [m/s] Vehicle speed points
% P_tun =		[0.7 1.6 2.9 4.7 7.1 10.5 15.0 20.6 27.7 36.4 46.9 59.2 90.6 109.9]'*746;		% [W] Power at crank to move v_vec
% tp_map = NaN(length(v_vec),1);
% save('tune1','v_map','P_tun','tp_tun')








