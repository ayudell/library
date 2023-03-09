clear
close all

x = 0:1:100;
y = x.^2;       % Example function

dydx = 1/3*x.^3;  % Analytical solution

dx = 1;     % Differentiation step (smaller = slower but more accurate)
x_diff = min(x):dx:max(x);

% 1st order numerical differentiation
i = 0;
dydx_num(1) = 0;
for i = 1:length(x_diff)-1
    dydx_num(i+1) = dydx_num(i) + dx * x_diff(i)^2;   
end

    figure
    grid on
    hold on
    plot(x,dydx)
    plot(x_diff,dydx_num)
    xlabel('x')
    ylabel('dydx')
    titlestr = sprintf('Numerical vs. Analytical differentiation\n\\Deltax = %0.2f',dx);
    title(titlestr)
    legend('Exact Solution','Numerical Solution')