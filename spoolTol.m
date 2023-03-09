

clear
close all

d1 = 13;						% [mm] Nominal bore diameter
d1_delta_hi = 0.01;			% [mm] Bore plus diametral tolerance
d1_delta_low = d1_delta_hi;	% [mm] Bore minus diametral tolerance

c_min = .0005*25.4;		% [mm] MIN acceptable clearance
c_max = .0018*25.4;     % [mm] MAX acceptable clearance

% Bore MMC and LMC
d_bore_MMC = d1 - d1_delta_low;	% [mm] Bore diameter at MMC
d_bore_LMC = d1 + d1_delta_hi; % [mm] Bore diameter at LMC

% Spool MMC and LMC
d_spool_LMC = d_bore_LMC-c_max;	% [mm] Spool major diamater at LMC to achieve MAX clearance
d_spool_MMC = d_bore_MMC-c_min;	% [mm] Spool major diamater at MMC to achieve MIN clearance

% Bore Nominal and +/- Tol
d1_nom = (d_bore_LMC + d_bore_MMC)/2;		% [mm] Bore Nominal diameter
d1_tol = (d_bore_LMC - d_bore_MMC)/2;		% [mm] Bore +/- tolerance

% Spool Nominal and +/- Tol
d_spool_nom = (d_spool_LMC + d_spool_MMC)/2;	% [mm] Spool major nominal diameter
d_spool_tol = (d_spool_MMC - d_spool_LMC)/2;	% [mm] Spool major +/- tolerance

% Valve End
% Amplification Factor
k_v = 2;

A1 = pi*d1^2/4;     % [mm^2] Area of major diameter
A_m = A1/k_v;       % [mm^2] Metering area

% % Meter off of end
% d_m = sqrt(4*A_m/pi);        % [mm] Valve minor diameter
% A_v = pi*d_m^2/4;           % [mm^2] Valve metering area

% % Meter off of annulus
dm_spool_nom = sqrt(d1^2-4*A_m/pi);    % [mm] Valve minor diameter
A_v = pi*(d1^2-dm_spool_nom^2)/4;     % [mm^2] Valve metering area 

cm_min = 0.0064;	% [mm] Minimum minor diameter diametral clearance

dm_spool_tol = 0.0064;	% [mm] Spool minor diameter +/- tolerance
dm_spool_pos = 0.01;		% [mm] Spool minor diameter position tolerance WRT major diameter

dm_tol = 0.01;	% [mm] Bore minor diameter +/- tolerance
dm_pos = 0.02;	% [mm] Bore minor diameter position tolerance	

dm_spool_MMC = dm_spool_nom + dm_spool_tol;	% [mm] MMC (largest) minor spool diameter
dm_spool_LMC = dm_spool_nom - dm_spool_tol;	% [mm] LMC (smallest) minor spool diameter

dm_MMC = dm_spool_MMC + dm_spool_pos + dm_pos + cm_min;	% [mm] MMC (smallest) minor bore size

dm_nom = dm_MMC + dm_tol;	% [mm] Nominal bore size
dm_LMC = dm_nom + dm_tol;	% [mm] LMC (Largest) bore size

c_dm_spool_min = dm_MMC - dm_spool_MMC;	% [mm] Minimum diametral clearance, not considering position
c_dm_spool_nom = dm_nom - dm_nom;	% [mm] Nominal diametral clearance, not considering position
c_dm_max = dm_LMC - dm_spool_LMC;	% [mm] Maximum diametral clearance, not considering position

int_max = dm_MMC - dm_spool_MMC - dm_spool_pos - dm_pos;	% [mm] Possible interference at worst case

fprintf('\n\n======RESULTS======\n')
fprintf('Bore Nominal:               %2.4f mm\n',d1_nom)
fprintf('Bore tolerance +/-:          %2.4f mm\n',d1_tol)
fprintf('Spool Nominal:              %2.4f mm\n',d_spool_nom)
fprintf('Spool tolerance +/-:         %2.4f mm\n',d_spool_tol)
fprintf('\nMinor\n')

fprintf('Minor bore Nominal:               %2.4f mm\n',dm_nom)
fprintf('Minor bore tolerance +/-:         %2.4f mm\n',dm_tol)
fprintf('Minor spool Nominal:              %2.4f mm\n',dm_spool_nom)
fprintf('Minor spool tolerance +/-:        %2.4f mm\n\n',dm_spool_tol)

fprintf('Min Clearance:             %0.4f in\n',c_dm_spool_min/25.4)
fprintf('Nominal Clearance:         %0.4f in\n',c_dm_spool_nom/25.4)
fprintf('Max Clearance:             %0.4f in\n',c_dm_max/25.4)
fprintf('========================\n\n')