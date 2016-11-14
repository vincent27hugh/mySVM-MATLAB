function fx=fun_fx(X,Omega_f,Omega_f0)
% X is N_l*p, Omega_f is p*1, Omega_f0 is constant
% N_l is the # of labeled data
% p is the number of parameter
% f(x)=[1_{N_l},X]*[Omega_f0;Omega_f]
fx=X*Omega_f+Omega_f0;
return
