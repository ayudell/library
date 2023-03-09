
function [C,Index] = findMin(A)
% finMin will find the minimum value and indices for that value in array A.  The function will
% produce an error if the minimum value of A is not unique.  A may be up to 8 dimensions.

N = length(size(A));
if N > 6
    error('ERROR: Maximum matrix dimension is 6D per findMin function')
end
C = A;
for i = 1:N
    [C,I] = min(C);
end
I = find(A==C);     % Find index of minmum value
% 
% if length(size(I)) > 1
%     error('ERROR: Minimum element must be unique per findMin function')
% end

if N == 1
    [Index(1)] = ind2sub(size(A),I);
elseif N == 2
    [Index(1),Index(2)] = ind2sub(size(A),I);
elseif N == 3
    [Index(1),Index(2),Index(3)] = ind2sub(size(A),I);
elseif N == 4
    [Index(1),Index(2),Index(3),Index(4)] = ind2sub(size(A),I);
elseif N == 5
    [Index(1),Index(2),Index(3),Index(4),Index(5)] = ind2sub(size(A),I);
elseif N == 6
    [Index(1),Index(2),Index(3),Index(4),Index(5),Index(6)] = ind2sub(size(A),I);
elseif N == 7
    [Index(1),Index(2),Index(3),Index(4),Index(5),Index(6),Index(7)] = ind2sub(size(A),I);
elseif N == 8
    [Index(1),Index(2),Index(3),Index(4),Index(5),Index(6),Index(7),Index(8)] = ind2sub(size(A),I);
end

end