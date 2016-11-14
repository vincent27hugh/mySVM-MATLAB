function fz=fun_U_SSVM(z)
% U_SSVM(z)=(1-abs(z))+
fz=max(1-abs(z),0);
return