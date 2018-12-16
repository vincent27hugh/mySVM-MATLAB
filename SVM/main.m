%main.m
close all
clear 

Kernel_Cell={'linear';'ploynomial';'RBF';'Sigmoid'};

% Step 1: Load the data
% X is the matrix of input data with dimension of N-by-p
% where N is the number of instances and p is the number of features
% For the convenience of visualization, we define p=2 here;
data_fisheriris;
X=inputs;
Y=outputs;

% Step 2: Define parameters
% poly_con is the parameter for Polynomial Kernel 
% gamma is the parameter for Gaussian Kernel 
% kappa1 & kappa2 are the parameters for Sigmoid Kernel 
% precision is the tolerance of precision
% Cost is the hyperparameter for SVM
define_parameters;

% Step 3: Fit the model
% Choose the kernel
kernel=char(Kernel_Cell(4));
%
[alpha,Ker,beta0]=SVM(X,Y,kernel);

% Step 4: Visualize the 2D plot
SVM_plot(X,Y,alpha,beta0,kernel);


