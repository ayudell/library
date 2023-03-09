clear
close all

alpha_al = 23e-6;		% [mm/mm-C] Aluminum coefficient of thermal expansion
alpha_st = 12.3e-6;		% [mm/mm-C] Aluminum coefficient of thermal expansion

T_o = 22;		% [C] Nominal temp
	
T_high = 120;				% [C] High temp
T_deltahigh = T_high-T_o;
T_low = -40;				% [C] Low temp
T_deltalow = T_low - T_o;

l_st_nom = 14.8;

l_al_nom = 14.8;

l_1_high = l_st_nom*(1 + alpha_st*T_deltahigh);
l_2_high = l_al_nom*(1 + alpha_al*T_deltahigh);

l_1_low = l_st_nom*(1 + alpha_st*T_deltalow);
l_2_low = l_al_nom*(1 + alpha_al*T_deltalow);

c_high = l_2_high  - l_1_high;		% [mm] Length change at high temp
c_low = l_2_low  - l_1_low;			% [mm] Length change at low temp

c_total = c_high-c_low;				% [mm] Total length change across temp delta