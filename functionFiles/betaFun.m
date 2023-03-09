function [y] = betaFun(x,a,b)

y = 1/beta(a,b) .* x.^(a-1).*(1-x).^(b-1);
