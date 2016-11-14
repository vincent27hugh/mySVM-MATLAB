function fx=fun_s2_SVM(X_l,X_u,Omega_g,Omega_g0)
global Cost2 
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];
fx=0;
for j=N_l+1:N
    fx=fx+Cost2*fun_U2(fun_gx(X(j,:),Omega_g,Omega_g0));
end
return