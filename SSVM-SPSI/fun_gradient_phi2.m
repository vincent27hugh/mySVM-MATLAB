function fz=fun_gradient_phi2(z)
% grad(phi_2(z))= 0, if z>0; ,-2, ow
if z>0
    fz=0;
else
    fz=-2;
end
return