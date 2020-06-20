function patch = sample_img_pathes (img, patch_size, single_patch_num)


if ndims(img) == 3
    img = rgb2gray(img);
end
[nrow, ncol] = size(img);

img = double(img);
xrow = floor(rand(single_patch_num,1)*(nrow - patch_size))+1;   % generate the x-position of img patches waited for sampling
ycol = floor(rand(single_patch_num,1)*(ncol- patch_size))+1;    % generate the y-position

patch = zeros(patch_size^2, single_patch_num);
for  j = 1:single_patch_num
    row = xrow(j);
    col = ycol(j);
    Hpatch = img(row:row+patch_size-1,col:col+patch_size-1);
    patch(:,j) = Hpatch(:)-mean(Hpatch(:));
end