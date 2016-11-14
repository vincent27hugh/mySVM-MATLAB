%Sep1,2016
%SSVM
%linear case
function [beta_kp1,Ker_kp1,beta0_kp1]=SSVM(X_l,X_u,Y_l,kernel,...
    VOmega_f,VOmega_g)
% X is N*p, Y is N*1,{-1,1}
% Constant=Inf for Hard Margin
global  precision Cost1 Cost2 Cost3
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];

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
%Delta
Delta1=zeros(N_l,1);%[N_l,1]
Delta2=Cost2*sign(X_u*beta+beta0);%[N_u,1]
Delta=[Delta1;Delta2];%[N,1]
%%%%%%
%Quadprog
% NotesP113
T_11=diag(Y_l);
T_12=[diag(-ones(N_u,1)),diag(ones(N_u,1))];
T_1=blkdiag(T_11,T_12);%[N,N+N_u]

T_21=diag(ones(N_l,1));
T_22=[diag(-ones(N_u,1)),diag(-ones(N_u,1))];
T_2=blkdiag(T_21,T_22);

H=T_1'*Ker*T_1;
%Symmetric matrix of doubles. 
%Represents the quadratic in the expression 1/2*x'*H*x + f'*x.
f=(Ker*Delta)'*T_1-ones(N,1)'*T_2;
%Vector of doubles. 
%Represents the linear term in the expression 1/2*x'*H*x + f'*x.

Aeq=ones(N,1)'*T_1;
%Matrix of doubles. 
%Represents the linear coefficients in the constraints Aeq*x = beq.
beq=-Delta2'*ones(N_u,1);
%Vector of doubles. 
%Represents the constant vector in the constraints Aeq*x = beq.

A_1=[diag(ones(N_l,1));diag(-ones(N_l,1))];
A_2=diag(-ones(2*N_u,1));
A_31=diag(-ones(N_u,1));
A_32=diag(ones(N_u,1));
A_3=[A_31,A_31;A_32,A_32];
A_23=[A_2;A_3];
A=blkdiag(A_1,A_23);
%Matrix of doubles. 
%Represents the linear coefficients in the constraints A*x ? b.

b_1=repmat(Cost1,N_l,1);
b_2=zeros(N_l+3*N_u,1);
b_3=repmat(Cost2,N_u,1);
b=[b_1
    b_2
    b_3];
%Vector of doubles. 
%Represents the constant vector in the constraints A*x ? b.

alpha=quadprog(H,f,A,b,Aeq,beq);
% quadprog
%%%%%%
beta_kp1=(((T_1*alpha)'+Delta')*X)';%new beta
% get new beta0
serial_num=(1:N_l)';%sequence 
serial_sv=serial_num(alpha(1:N_l)>precision&alpha(1:N_l)<Cost1);
%delete zero alpha and alpha =Cost1

if size(serial_sv,1)~=0
    %beta0 satisfy KKT's condition
    disp('KKT condition is satisfied!');
    temp_beta0=0;
    for i=1:size(serial_sv,1)
        temp_beta0=temp_beta0+Y_l(serial_sv(i))-X_l(serial_sv(i),:)*beta_kp1;
    end
    beta0_kp1=temp_beta0/size(serial_sv,1);%new beta0
else
    % there is no i such that yi(betaT*xi+beta0)=1,KKT's condition is not
    % applicable.LP is applied.
    disp('KKT condition is NOT satisfied!');
    f_LP=Delta2'*ones(N_u,1)+sum(T_1*alpha);
    A_LP=Y_l;
    b_LP=ones(N_l,1)-Y_l.*(X_l*beta_kp1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    beta0_kp1=linprog(f_LP,A_LP,b_LP);%?%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

Ker_kp1=Ker;%new Ker
return










