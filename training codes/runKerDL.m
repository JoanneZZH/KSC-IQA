%% train one dictionary A via testing KernelDL
% clear all;
sampleName = 'slt_patches_8_9492_5.mat';
dirpath = 'D:\Joanne\文档\本机\项目\2017-KSC-IQA\FinalCode-p';  %%%%% your root fold to unzip the codes
addpath([dirpath '\training codes\KernelDL']);
load ([dirpath '\data\Training_smps\' sampleName]);

T = 5;  % The level sparsity 
iternum = 20;
ds = 256;  % dic size of A
patch_size = 8;

% Produce DFT basis; and take real part
G = dftmtx(patch_size); G = kron(G,G);
G = real(G);

params = [] ; 
params.data = Y_slt ; 
params.T = T;
params.iternum = iternum ; 
params.dictsize = ds ; 
params.memusage ='high' ; 
params.G = G;
params.dirpath = dirpath;

% kernel = 'gauss';  param1 = 0.5;   param2 = 0 ;
% kernel = 'poly' ;  param1 = 0 ; param2 = 3; 
kernel = 'linear';  param1 = 0 ; param2 = 0; 

params.kernel = kernel;    
params.kervar1 = param1;
params.kervar2 = param2;

tic
[A, C_ker] = kerDL(params);
toc;

% 命名规则
str = regexp(sampleName,'_','split');
patch_size = str{3};
patch_num = str{4};
threshold = str{5};

A_name = ['A_' kernel '_'  patch_num '_' num2str(param1) '_' num2str(param2) '_' threshold '_' num2str(ds)];
savepath = [dirpath '\data\A\Patch_' patch_size];
if (~exist(savepath,'dir'))
    mkdir(savepath);
end
save ([ savepath '\' A_name '.mat' ],'A');