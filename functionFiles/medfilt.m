function [dataOut] = medfilt(data,n)

if mod(n,2) ~= 1
	error('MEDIAN FILTER MUST BE ODD')
end

dataOut = NaN(length(data),n);
dataOut(:,1) = data;

m = (n-1)/2;
for i  = 1:m
	dataOut(1:end-i,2*i) = data(1+i:end,1);
	dataOut(i+1:end,2*i+1) = data(1:end-i,1);
end
	
dataOut = median(dataOut,2);
% dataOut = mean(dataOut,2);
