% define_parameters
% Constant=Inf for Hard Margin
global poly_con gamma kappa1 kappa2 precision Cost
poly_con=2; % For Polynomial Kernel
gamma=1/size(X,1);% For RBF
kappa1=1/size(X,1);kappa2=kappa1; % For Sigmoid

precision=10^-5;Cost=1000;