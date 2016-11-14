%test
%main
%main.m
close all
clear 

data_fisheriris;
X=inputs;
Y=outputs;

%rng(0,'twister');
r = randi([1 100],10,1);

[X_l,Y_l,X_u]=select_labeldata(X,Y,r);

Kernel_Cell={'linear';'ploynomial';'RBF';'NeutralNet'};

% Constant=Inf for Hard Margin
global poly_con gamma kappa1 kappa2 precision Cost1 Cost2
poly_con=2;gamma=0.02;kappa1=0.1;kappa2=0.2;precision=10^-5;Cost1=1000;
Cost2=1000;

global tolerence
tolerence=1e-4;

kernel=char(Kernel_Cell(1));
X_var=X_l;Y_var=Y_l;

[alpha,Ker,beta0]=SVM(X_var,Y_var,kernel);

SVM_plot(X_var,Y_var,alpha,beta0,kernel);