function fx=fun_s2_phi(X_l,X_u,Omega_f,Omega_f0,Omega_g,Omega_g0)
global Cost1 Cost2 
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];
fx1=0;fx2=0;
for i = 1:N_l
    fx1=fx1+Cost1*fun_phi2(Y(i)*fun_fx(X(i,:),Omega_f,Omega_f0));
end
for j=N_l+1:N
    fx2=fx2+2*Cost2*fun_U2(fun_gx(X(j,:),Omega_g,Omega_g0));
end
fx=fx1+fx2;
return