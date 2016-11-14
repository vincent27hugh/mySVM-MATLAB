function SVM_plot(X,Y,beta,beta0,kernel,fig1)
% X is with 2 coloums

global Cost1
figure(fig1)
hold on
for i=1:size(Y,1)
    if Y(i)==1
        pl1=plot(X(i,1),X(i,2),'ro','DisplayName','labeled(+1)');
    elseif Y(i)==-1
        pl2=plot(X(i,1),X(i,2),'bx','DisplayName','labeled(-1)');
    end
end
%linear
xvar=linspace(min(X(:,1)),max(X(:,1)),100);


yvar=(-beta0-xvar*beta(1))/beta(2);
plot(xvar,yvar,'-');
xlabel('X1');ylabel('X2');title(strcat('c=',num2str(Cost1)));
legend([pl1 pl2]);

hold off
return