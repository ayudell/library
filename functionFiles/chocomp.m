function beta_e = chocomp(beta, R, P, P_o, gamma)

% beta_e = beta*((R+(P/P_o+1)^(1/gamma)*exp(-P/beta))/...
%     (R/gamma*beta/(P+P_o)+(P/P_o+1)^(1/gamma)*exp(-P/beta)));


beta_e = beta*(((R+(P/P_o+1)^(1/gamma))/...
    (R/gamma*beta/(P+P_o)+(P/P_o+1)^(1/gamma))));
