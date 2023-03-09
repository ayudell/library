% FILE: plotExample.m
% NOTE: This is a script to demonstrate the features of MATLAB line
% plotting.  To see MATLAB support for any function, type "doc
% (functionName)" in the command window.  Example: doc plot
% AUTHOR: Alexander Yudell, Copyright TEAM Industries, 2021
% ASSOCIATED FILES: None
% VERSIONS: None

clear		% Clear workspace
close all	% Close all open figures

% Create functions to plot
t = 0:0.1:20;
sin_t = 5*sin(t) + 5;
cos_t = 5*cos(2*t) + 5;

%% SINGLE PLOT
fig1 = figure;		% Create figure and handle
fig1.Position = [256   370   756   599];	% Location of figure: [xLoc,yLoc,xSize,ySize]
fig1.Color = [1 1 1];		% Set figure background color to white
grid on				% Turn on chart grid
hold on				% Allow for multiple plots on current fig
plot(t,sin_t)		% Plot X and Y
plot(t,cos_t,'--')	% Plot X and Z with a dotted line
plot(t,sin_t,'ro')	% Place red markers on X,Y datapoints
xlim([0 10])		% Set the x limits of the figure axes
ylim([0 12])		% Set the y limits of the figure axes
xlabel('xLabel (units)')	% Create an X label
ylabel('yLabel (units)')	% Create a Y label
legend('Sine','Cosine','Location','northwest')	% Create a legend and call out a location
title('TITLE')	% Plot title


%% SUBPLOTS

fig2 = figure;
fig2.Position = [1024 90 880 880];	% Location of figure: [xLoc,yLoc,xSize,ySize]
fig2.Color = [1 1 1];
% Subplot 1
ax(1) = subplot(2,1,1);  % Create subplot (# plots in Y, # plots in X, current subplot position)
grid on  
hold on  
plot(t,sin_t)	
plot(t,sin_t,'ko')	
ylim([0 12])
xlabel('xLabel (units)')
ylabel('yLabel (units)')
legend('Fit','Data','Location','Northeast')
title('TITLE1')
% Subplot 2
ax(2) = subplot(2,1,2);
grid on
hold on
plot(t,cos_t,'--')		% Plot X and Z with a dashed line
ylim([-5 15])
xlabel('xLabel (units)')
ylabel('yLabel (units)')
legend('Fit2','Location','Southwest')
title('TITLE2')

linkaxes(ax,'x')	% Link all x axes with the handle <ax(#)>
xlim([0 6])			% Set x limit after linkaxes

%% DUAL Y AXIS

fig3 = figure;
fig3.Position = [124   112   560   420];	% Location of figure: [xLoc,yLoc,xSize,ySize]
fig3.Color = [1 1 1];
% Subplot 1
grid on  
hold on  
yyaxis left			% Call out left axis.  Everything after this command applies only to the left axis
plot(t,sin_t)
ylabel('yLeftLabel (units)')
ylim([0 12])
yyaxis right		% Call out right axis.  Everything after this command applies only to the right axis
plot(t,8*cos_t)
ylabel('yRightLabel (units)')
ylim([0 80])
xlabel('xLabel (units)')
legend('Sine','Cosine','Location','Northwest')
title('Dual Y TITLE3')







