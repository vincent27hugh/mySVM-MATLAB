function fz=fun_gradient_U2(z)
% grad(U_2(z))= 1, if z>0; ,-1, ow
if z>0
    fz=1;
else
    fz=-1;
end
return