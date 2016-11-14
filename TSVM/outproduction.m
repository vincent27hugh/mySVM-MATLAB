function U=OutProduction(V1,V2)
%V1,V2 are coloum vector
for i=1:max(size(V1))
    for j = 1:max(size(V2))
        U(i,j)=V1(i)*V2(j);
    end
end
return