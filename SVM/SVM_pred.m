%Dec15,2018
%SVM prediction
function Y_new = SVM_pred(X_new, X, Y,kernel,alpha,beta0)
% X is N*p
% X_new is new data with M*p, alpha is vector with N*1, beta0 is scalar

M = size(X_new,1);

switch kernel
    case 'linear'
        Ker=Ker_Linear(X,X_new);
    case 'ploynomial'
        Ker=Ker_Polynomial(X,X_new);
    case 'RBF'
        Ker=Ker_RBF(X,X_new);
    case 'NeutralNet'
        Ker=Ker_NeuralNet(X,X_new);
end

Y_new = sum(diag(alpha.*Y)*Ker,1)'+beta0*ones(M,1);

return
