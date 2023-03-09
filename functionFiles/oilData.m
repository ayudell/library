function [mu,rho,nu,Cv,k] = oilData(oil,T)
% Loads and interpolates oil properties.
% T must be in degrees C.

propFolder = 'C:\Users\alexyudell\Documents\MATLAB\Oil Properties\';

% Load property file
if strcmp(oil,'PentosinFFL4')
	load(strcat(propFolder,'pentosinFFL4props.mat'))
elseif strcmp(oil,'HGLV')
	load(strcat(propFolder,'HGLVprops.mat'))
elseif strcmp(oil,'LTCVT')
	load(strcat(propFolder,'LTCVTprops.mat'))
elseif strcmp(oil,'LTATF')
	load(strcat(propFolder,'LTATFprops.mat'))
end

mu = interp1q(mu_vec(:,1),mu_vec(:,2),T);
rho = interp1q(rho_vec(:,1),rho_vec(:,2),T);
Cv = interp1q(Cv_vec(:,1),Cv_vec(:,2),T);
k = interp1q(k_vec(:,1),k_vec(:,2),T);
nu = mu/rho;

end


