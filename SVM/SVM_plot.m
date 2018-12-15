function SVM_plot(X,Y,alpha,beta0,kernel)
% X is with 2 coloums

global Cost
figure
hold on
N = size(X,1);
for i=1:N
    if Y(i)==1
        plot(X(i,1),X(i,2),'ro');
    elseif Y(i)==-1
        plot(X(i,1),X(i,2),'bx');
    end
end
%linear
xvar=linspace(min(X(:,1)),max(X(:,1)),100);
switch kernel
    case 'linear'
        beta=X'*(alpha.*Y);
        yvar=(-beta0-xvar*beta(1))/beta(2);
        plot(xvar,yvar,'-');
        xlabel('X1');ylabel('X2');title(strcat('c=',num2str(Cost)));
    case 'polynomial'
        fun=@(X)Ker_Polynomial([xvar,X],[xvar,X])*(alpha.*Y)+beta0;
        X0 = zeros(size(xvar));
        yvar = fsolve(fun,X0);
        plot(xvar,yvar,'-');
        xlabel('X1');ylabel('X2');title(strcat('c=',num2str(Cost)));
    case 'RBF'
        
        fun=@(X)(Ker_RBF([xvar,X],[xvar,X]))*(alpha.*Y)+beta0;
        X0 = zeros(size(xvar));
        yvar = fsolve(fun,X0);
        plot(xvar,yvar,'-');
        xlabel('X1');ylabel('X2');title(strcat('c=',num2str(Cost)));
end

hold off
return