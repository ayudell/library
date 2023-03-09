% NOTE: This is a Holoborodko numerical differentiator that can use a 5, 7
% or 11 point centered average.
% AUTHOR: Alexander Yudell, 3/13/2020
% ASSOCIATED FILES: None.

function [f_dot] = hDiff(f,t,N)


h = t(2) - t(1);  % Timestep
M = (N-1)/2 + 1; % Stencil offset
f_dot = NaN(length(f),1);
if N == 5
	f_dot(M:end-M,1) = (2*(f(M+1:end-M+1,1) - f(M-1:end-M-1,1)) + (f(M+2:end-M+2,1) - f(M-2:end-M-2,1)))/(8*h);
elseif N == 7
	f_dot(M:end-M,1) = (5*(f(M+1:end-M+1,1) - f(M-1:end-M-1,1))...
					  + 4*(f(M+2:end-M+2,1) - f(M-2:end-M-2,1))...
					  + 1*(f(M+3:end-M+3,1) - f(M-3:end-M-3,1)))/(32*h);
elseif N == 11
	f_dot(M:end-M,1) = (42*(f(M+1:end-M+1,1) - f(M-1:end-M-1,1))...
					  + 48*(f(M+2:end-M+2,1) - f(M-2:end-M-2,1))...
					  + 27*(f(M+3:end-M+3,1) - f(M-3:end-M-3,1))...
					  + 8*(f(M+4:end-M+4,1) - f(M-4:end-M-4,1))...;
					  + 1*(f(M+5:end-M+5,1) - f(M-5:end-M-5,1)))/(512*h);
end
