function fz=fun_L_SPSI(z)
% L_SPSI(z)=phi(z)=[ 1-sign(z) z>=1 or z<0
%                    2(1-z)  otherwise ]
fz=zeros(size(z));
for i = 1:length(z)
    if z(i) > 1 || z(i) < 0
        fz(i) = 1- sign(z(i));
    else
        fz(i) = 2*(1-z(i));
    end
end
return