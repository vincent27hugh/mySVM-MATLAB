function fz=fun_U_SPSI(z)
% U_SPSI(z)=2*(1-abs(z))+
fz=2*max(1-abs(z),0);
return