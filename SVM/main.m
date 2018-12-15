%main.m
close all
clear 

data_fisheriris;
X=inputs;
Y=outputs;
Kernel_Cell={'linear';'ploynomial';'RBF';'NeutralNet'};


% Constant=Inf for Hard Margin
global poly_con gamma kappa1 kappa2 precision Cost
poly_con=2;gamma=1/size(X,1);kappa1=0.1;kappa2=0.2;precision=10^-5;Cost=1000;

kernel=char(Kernel_Cell(2));
[alpha,Ker,beta0]=SVM(X,Y,kernel);

SVM_plot(X,Y,alpha,beta0,kernel);


