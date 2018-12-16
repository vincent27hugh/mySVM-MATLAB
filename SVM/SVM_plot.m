function SVM_plot(X,Y,alpha,beta0,kernel)
% X is with 2 coloums

global Cost poly_con gamma kappa1
figure
hold on
N = size(X,1);

plot(X(Y==1,1),X(Y==1,2),'ro',...
    'LineWidth', 4,...
    'MarkerSize', 4);

plot(X(Y==-1,1),X(Y==-1,2),'bs',...
    'LineWidth', 4,...
    'MarkerSize', 4);

%
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
scores = SVM_pred(xGrid, X, Y,kernel,alpha,beta0);

contour(x1Grid,x2Grid,reshape(scores,size(x1Grid)),[0 0],'k',...
    'LineWidth', 4);

xlabel('$X_1$','FontSize', 18,...
    'Interpreter','latex');
ylabel('$X_2$', 'FontSize', 18,...
    'Interpreter','latex');
switch kernel
    case 'linear'
        title({'SVM',strcat('Kernel:',kernel,';C=',num2str(Cost))}, 'FontSize', 18,...
    'Interpreter','latex');
    case 'ploynomial'
        title({'SVM',strcat('Kernel:',kernel,';C=',num2str(Cost),';n=',num2str(poly_con))}, 'FontSize', 18,...
    'Interpreter','latex');
    case 'RBF'
        title({'SVM',strcat('Kernel:',kernel,';C=',num2str(Cost),';$\gamma$=',num2str(gamma))}, 'FontSize', 18,...
    'Interpreter','latex');
    case 'Sigmoid'
        title({'SVM',strcat('Kernel:',kernel,';C=',num2str(Cost),';$\kappa$=',num2str(kappa1))}, 'FontSize', 18,...
    'Interpreter','latex');
end
legend({'+1';'-1'},'FontSize',16,'Location', 'Best');
hold off
% Maximize figure
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
str_fig = strcat('SVM_',kernel,'_C=',num2str(Cost));
saveas(gcf, str_fig,'png');
saveas(gcf, str_fig);
return