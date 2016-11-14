function gx=fun_gx(X,Omega_g,Omega_g0)
% X is N_u*p, Omega_g is p*1, Omega_g0 is constant
% N_u is the # of unlabeled data
% p is the number of parameter
% f(x)=[1_{N_u},X]*[Omega_g0;Omega_g]
gx=X*Omega_g+Omega_g0;
return
