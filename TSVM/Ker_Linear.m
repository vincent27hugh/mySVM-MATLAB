function Y=Ker_Linear(X1,X2)
Y=zeros(size(X1,1),size(X2,1));%Gram Matrix
for i=1:size(X1,1)
    for j=1:size(X2,1)
        Y(i,j)=dot(X1(i,:),X2(j,:));
    end
end

return