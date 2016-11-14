function Y=Ker_NeutralNet(X1,X2)
global kappa1 kappa2
Y=zeros(size(X1,1),size(X2,1));%Gram Matrix
for i=1:size(X1,1)
    for j=1:size(X2,1)
        Y(i,j)=tanh(kappa1*dot(X1(i,:),X2(j,:))+kappa2);
    end
end

return