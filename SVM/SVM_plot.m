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
%
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
scores = SVM_pred(xGrid, X, Y,kernel,alpha,beta0);

contour(x1Grid,x2Grid,reshape(scores,size(x1Grid)),[0 0],'k');

xlabel('X1');ylabel('X2');title(strcat('c=',num2str(Cost)));
    

hold off
return