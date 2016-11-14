function TSVM_plot(X_l,X_u,Y_l,beta,beta0,kernel,fig1)
% X is with 2 coloums

global Cost1 Cost2
N_l=size(X_l,1);N_u=size(X_u,1);N=N_l+N_u;
X=[X_l;X_u];

figure(fig1)
hold on
for i=1:N_l
    if Y_l(i)==1
        pl1=plot(X_l(i,1),X_l(i,2),'ro','DisplayName','labeled(+1)');
        
    elseif Y_l(i)==-1
        pl2=plot(X_l(i,1),X_l(i,2),'bx','DisplayName','labeled(-1)');
    end
end
pl3=scatter(X_u(:,1),X_u(:,2),'g+','DisplayName','unlabeled');
%linear
xvar=linspace(min(X(:,1)),max(X(:,1)),100);

yvar=(-beta0-xvar*beta(1))/beta(2);
plot(xvar,yvar,'-');
xlabel('X1');ylabel('X2');
title(strcat('C1=',num2str(Cost1),'; C2=',num2str(Cost2)));
legend([pl1 pl2 pl3])
hold off
return