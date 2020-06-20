function Y = rnd_smp_patch (root_path, patch_size, patch_num)
    imgs_path = [root_path '\getData\Training_imgs'];
    imgs_dir = dir(fullfile(imgs_path, '*.bmp'));
    imgs_num = length(imgs_dir);
    
    Y = [];
    for ii = 1:imgs_num
        single_patch_num = floor(patch_num / imgs_num);
        img = imread(fullfile(imgs_path, imgs_dir(ii).name));
        H = sample_img_pathes(img, patch_size, single_patch_num);
        Y = [Y H];
    end
    
    train_patch_path =  [root_path '\getData\Training_smps\rnd_patches_' num2str(patch_size) '_' num2str(patch_num) '.mat'];
    save(train_patch_path, 'Y');
end