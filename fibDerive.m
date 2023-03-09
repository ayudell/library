clear
close all

I = 1:1000;
f = [1;1];

for i = length(f)+1:length(I)
	f(i) = f(i-1) + f(i-2);
end


j = 0;
% Check for primality
tic
for i = 1:length(f)
	n = f(i);		% Number we are checking for primality
	l = 0;
	k = 2;
	while k < sqrt(n)
		k = k+1;
		p = k;
		if n - p*floor(n/p) == 0	% mod(n,p)
			l = 1;
			break
		end
	end
	
	if l ~= 1
		j = j+1;
		ind(j,1) = I(i);
		prime2(j,1) = n;
	end
end
toc

load('primeList')

A = intersect(f,prime);
% primePred = I./(log(I)-1);


figure
grid on
hold on
plot(I,f)
plot(ind,prime2,'ro')

