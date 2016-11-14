%delect labeled data
function [X_l,Y_l,X_u]=select_labeldata(DataX,DataY,Datar)
N=max(size(DataY));N_l=max(size(Datar));p=min(size(DataX));
X_l=zeros(N_l,p);Y_l=zeros(N_l,1);
r_u=(1:N);
for i=1:N_l
    X_l(i,:)=DataX(Datar(i),:);
    Y_l(i)=DataY(Datar(i));
    r_u=r_u(r_u~=Datar(i));
end

X_u=DataX(r_u,:);

return