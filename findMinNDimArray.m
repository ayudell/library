
function [C,I] = findMin(A);
n = size(A);
N = length(size(A));

C = A;
for i = 1:N
    C = min(C);
end
I = find(A==C);
[I_row, I_col] = ind2sub(size(A),I)