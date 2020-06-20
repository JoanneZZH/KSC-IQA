% ==============================================================
% This file is to sample image patches randomly to obtained 
% training images samples （the set of vectorized img patches）
% ==============================================================

clc;
clear;

% Initialize parameters
root_path = 'D:\Joanne\文档\本机\项目\2017-KSC-IQA';  % root directory
patch_size = 8;            % image patch size
nSmp       = 10000;         % number of patches to sample

% randomly sample image patches
Y = rnd_smp_patch(root_path,patch_size,nSmp);

% prune patches with small variances, threshold chosen based on the
% training data
pvars = var(Y, 0, 1);  % Yi的方差
% threshold  = median(pvars);
threshold = 3;
idx = (pvars > threshold);

%Select image patches with large variance
Y_slt = Y(:,idx);
Ncol = size(Y_slt,2);
patch_path = [root_path '\getData\Training_smps\slt_patches_' num2str(patch_size) '_' num2str(Ncol) '_' num2str(threshold) '.mat'];
save(patch_path, 'Y_slt');