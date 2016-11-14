%June11,2016
%SVM
function [alpha,Ker,beta0]=SVM(X,Y,kernel)
% X is N*p, Y is N*1,{-1,1}
% Constant=Inf for Hard Margin
global  precision Cost1 Cost2

switch kernel
    case 'linear'
        Ker=Ker_Linear(X,X);
    case 'ploynomial'
        Ker=Ker_Polynomial(X,X);
    case 'RBF'
        Ker=Ker_RBF(X,X);
    case 'NeutralNet'
        Ker=Ker_NeutralNet(X,X);
end

H=outproduction(Y,Y).*Ker;
f=repmat(-1,size(X,1),1);
Aeq=Y';
beq=0;
A_1=diag(ones(size(X,1),1));
A_2=diag(-1*ones(size(X,1),1));
A=[A_1
    A_2];
b_1=repmat(Cost1,size(X,1),1);
b_2=zeros(size(X,1),1);

b=[b_1
    b_2];
alpha=quadprog(H,f,A,b,Aeq,beq);



serial_num=(1:size(X,1))';
serial_sv=serial_num(alpha>precision&alpha<Cost1);

temp_beta0=0;
for i=1:size(serial_sv,1)
    temp_beta0=temp_beta0+Y(serial_sv(i));
    temp_beta0=temp_beta0-sum(alpha(serial_sv(i))*...
        Y(serial_sv(i))*Ker(serial_sv,serial_sv(i)));
end
beta0=temp_beta0/size(serial_sv,1);



return










