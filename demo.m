%% for test one distorted image
%% read the reference image and the distorted image
I_ref_ori = imread('blur-color-1.png');
I_dist_ori = imread('blur-color-4.png');

%% setting 
T = 5;  % sparsity
patchSize = 8;
dicSizeA = 256;
G = dftmtx(patchSize); G = kron(G,G);
G = real(G);

dirpath = 'D:\Joanne\文档\本机\项目\2017-KSC-IQA\FinalCode-p';   %%%%% your root fold to unzip the codes

kerLinear.kernel = 'linear';
kerLinear.kervar1 = 0;
kerLinear.kervar2 = 0;
kerLinear.AName = 'A_linear_9492_0_0_5_256';
ker_choice{1} = kerLinear;


%% Initial parameters delivered to function
params = [];
params.patchSise = patchSize;
params.dicSizeA = dicSizeA;
params.dirpath = dirpath;
params.G = G;
params.T = T; %sparsity

params.kernel = ker_choice{1}.kernel;  
params.param1 = ker_choice{1}.kervar1;
params.param2 = ker_choice{1}.kervar2;
params.AName = ker_choice{1}.AName;

str = regexp(params.AName,'_','split');
patch_num = str{3};
threshold = str{6};
sample_name = ['slt_patches_' num2str(patchSize) '_'  patch_num '_'  threshold];
load ([ dirpath '\Data\Training_smps\' sample_name '.mat']);   % load training samples
load ([ dirpath '\Data\A\Patch_' num2str(patchSize) '\' params.AName  '.mat']);   % load A
params.A = A;  Arow = size(A,1);
params.Y_slt = Y_slt;
      

%% extract features and calculate the resulting score
score = IQA_KSC(I_ref_ori,I_dist_ori,params)
