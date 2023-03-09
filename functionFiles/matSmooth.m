function [data_mod] = matSmooth(data,n,edge)

[I,J] = size(data);
data_mod = data;
beta = 0.5;

if strcmp(edge,'no')
	for k = 1:n
		data_mod(2:I-1,2:J-1) = beta*data_mod(2:I-1,2:J-1) + 0.25*(1-beta)*...
			(data_mod([2:I-1]-1,[2:J-1]) + data_mod([2:I-1],[2:J-1]-1) +...
			data_mod([2:I-1],[2:J-1]+1) + data_mod([2:I-1]+1,[2:J-1]));
	end
% else
% 	for k = 1:n
% 		
% 		
% 		data_mod(2:I-1,2:J-1) = beta*data_mod(2:I-1,2:J-1) + 0.25*(1-beta)*...
% 			(data_mod([2:I-1]-1,[2:J-1]) + data_mod([2:I-1],[2:J-1]-1) +...
% 			data_mod([2:I-1],[2:J-1]+1) + data_mod([2:I-1]+1,[2:J-1]));
% 		
% 		
% 		
% 	end
end