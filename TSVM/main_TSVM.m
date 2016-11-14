%main
%main.m
% ref:Wang, Junhui, Xiaotong Shen, and Wei Pan. 
% "On transductive support vector machines." Contemporary Mathematics 443 (2007): 7-20.
% NotesP106~113
close all
clear 

data_fisheriris;%read data
DataX=inputs;
DataY=outputs;

%rng(0,'twister');
Datar=randperm(100);Datam=50;
Datar=Datar(1:Datam);
%get labeled and unlabeled data
[X_l,Y_l,X_u]=select_labeldata(DataX,DataY,Datar);

Kernel_Cell={'linear';'ploynomial';'RBF';'NeutralNet'};

% Constant=Inf for Hard Margin
global poly_con gamma kappa1 kappa2 precision Cost1 Cost2
global tolerence

% parameters for Polynomial Kernel
poly_con=2;
% parameters for Radial Basis Kernel
gamma=0.02;
% parameters for Neutral Net Kernel
kappa1=0.1;kappa2=0.2;
% Precision for zero
precision=1e-5;
% parameter of Cost 
Cost1=1000;Cost2=1000;

tolerence=1e-4;

X=[X_l;X_u];

%initial SVM
kernel=char(Kernel_Cell(1));

[alpha,Ker,beta0]=SVM(X_l,Y_l,kernel);
beta=X_l'*(alpha.*Y_l);

fig1=figure;
SVM_plot(X_l,Y_l,beta,beta0,kernel,fig1);

%TSVM
s_1=fun_s1(X_l,X_u,Y_l,beta,beta0);
% s_1(f)=C_1*sum(L(y_i*f(x_i)))+C_2*sum(U_1(f(x_j)))+0.5*norm(f)^2
s_2=fun_s2(X_l,X_u,beta,beta0);
% s_2(f)=C_2*sum(U_2(f(x_j)))
s=s_1-s_2;
old_s=0;

tic
N_Cal=0;
N_Total_Cal=200;
bar=waitbar(0,strcat('Iteration',num2str(N_Cal)));
% essential part
% we construct a DC decomposition of s(f)=s_1(f)-s_2(f);
while abs(s-old_s)>tolerence
    N_Cal=N_Cal+1;
    old_s=s;
    %waitbar
    waitbar(N_Cal/N_Total_Cal,bar,strcat('Iteration',num2str(N_Cal)));
    %TSVM
    [beta_kp1,Ker_kp1,beta0_kp1]=TSVM(X_l,X_u,Y_l,kernel,beta,beta0);
    beta=beta_kp1;beta0=beta0_kp1;%new beta and beta0
    %get new s_1 & s_2
    s_1=fun_s1(X_l,X_u,Y_l,beta,beta0);
    s_2=fun_s2(X_l,X_u,beta,beta0);
    s=s_1-s_2;
    disp('Iteration'),disp(N_Cal),disp(':');
    disp('diff='),disp(s-old_s);
    disp('beta='),disp(beta);
    disp('beta0='),disp(beta0);
    clf(fig1);
    TSVM_plot(X_l,X_u,Y_l,beta,beta0,kernel,fig1);
end
%
waitbar(1,bar,strcat('Complete! Total Iteration: ',num2str(N_Cal)));
toc
beep
pause(1);
close(bar)
