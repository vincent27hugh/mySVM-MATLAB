function fx=fun_s1_phi(X_l,X_u,Y,Omega_f,Omega_f0,Omega_g,Omega_g0)
global Cost1 Cost2 Cost3
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];
fx1=0;fx2=0;
for i=1:N_l
    fx1=fx1+Cost1*fun_phi1(Y(i)*fun_fx(X(i,:),Omega_f,Omega_f0));
end
for j=N_l+1:N
    fx2=fx2+2*Cost2*fun_U1(fun_gx(X(j,:),Omega_g,Omega_g0));
end
fx=fx1+fx2+0.5*Cost3*...
    (norm([Omega_f0;Omega_f]-[Omega_g0;Omega_g])^2)...
    +0.5*norm(Omega_g)^2;
return