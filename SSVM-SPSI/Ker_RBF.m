function Y=Ker_RBF(X1,X2)
global gamma
Y=zeros(size(X1,1),size(X2,1));%Gram Matrix
for i=1:size(X1,1)
    for j=1:size(X2,1)
        Y(i,j)=exp(-gamma*norm(X1(i,:)-X2(j,:))^2);
    end
end
return