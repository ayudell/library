function nu_T = silViscFun(nu_25,T)
% nu is in cSt
nu_T = 10^(763.1/(273 + T) - 2.559+log10(nu_25));
end

