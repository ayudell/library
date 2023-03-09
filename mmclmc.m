
function mmclmc(nom,tol)

mmc_mm = nom + tol;
lmc_mm = nom - tol;



mmc_in = (nom + tol)/25.4;
lmc_in = (nom - tol)/25.4;

fprintf('\n\nDimension: %3.4f +/- %1.4f mm\n',nom,tol)
fprintf('Window: %3.3f to %3.3f mm\n',mmc_mm,lmc_mm)
fprintf('Window: %3.4f to %3.4f in\n',mmc_in,lmc_in)
