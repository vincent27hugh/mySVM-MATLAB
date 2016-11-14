function fx=fun_s1(X_l,X_u,Y,beta,beta0)
global Cost1 Cost2 
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];
fx1=0;fx2=0;
for i=1:N_l
    fx1=fx1+Cost1*fun_L(Y(i)*fun_fx(X(i,:),beta,beta0));
end
for j=N_l+1:N
    fx2=fx2+Cost2*fun_U1(fun_fx(X(j,:),beta,beta0));
end
fx=fx1+fx2+0.5*norm(beta)^2;
return