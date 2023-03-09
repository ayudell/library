function [P_r, P_or, paramsOut] = bearingFun(bearing,Fr,Fa)

switch bearing
	case('6009')
		p = 3;
		C_r = 26.2e3;		% [N] Basic dynamic load rating, this load results in L10 life of 10^6 rev
		C_or = 15.1e3;		% [N] Basic static load rating
		i = 1;
		f_o = 15.3;			% [-] Factor
		n_lim = 11000;		% [rpm] Limiting bearing speed, oil lubrication
	case('6207')
		p = 3;
		C_r = 32.1e3;
		C_or = 15.4e3;
		i = 1;
		f_o = 15.3;
		n_lim = 11000;
	case('6008')
		p = 3;
		C_r = 20.9e3;
		C_or = 11.5e3;
		i = 1;
		f_o = 15.2;
		n_lim = 12000;
	otherwise
		error('Bearing not present in database')	
end

% Calculate Equivalent load
ifo = i*f_o*Fa/C_or;
% Prevent extrapolation from Koyo Models
ifo(ifo > 6.89) = 6.89;
ifo(ifo < 0.172) = 0.172;
e = 0.282994*ifo.^0.232868;		% Fit of Koyo bearing catalog Data, R^2 = 0.998169
FaFr = Fa./Fr;

for j = 1:length(FaFr)
if FaFr(j) <= e(j)
	X(j,1) = 1;
	Y(j,1) = 0;
else
	X(j,1) = 0.56;
	Y(j,1) = 0.440126*e(j)^(-0.997099);  % Fit of Koyo bearing catalog Data, R^2 = 0.999008
end
end
P_r = X.*Fr+Y.*Fa;		% [N] Equivalent radial load
P_or = 0.6*Fr + 0.5*Fa;	% [N] Equivalent static load

paramsOut.C_r = C_r;
paramsOut.C_or = C_or;
paramsOut.dmg_L10 = C_r^p*1e6;		% [N^p*rev] Damage to reach L10 life
paramsOut.n_lim = n_lim;		% [rpm] Limiting bearing speed



