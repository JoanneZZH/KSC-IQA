function [blkMatrix, row, col] = my_img2blk( Image ,patch_size )
% This function is used to patition an image to non-overlapped patches
% Image size: M*N
% Patch size: R*R
% The number of patches: [M/R]*[N/R]   []:ȡ��

Image=im2double(Image);
if (length(size(Image))>2)
    Image = rgb2gray(Image);
end

[M , N] = size(Image);
l = floor(M / patch_size) * patch_size;   %length
w = floor(N / patch_size) * patch_size;   %width
I = Image(1:l, 1:w);
blkMatrix = im2col(I, [patch_size,patch_size], 'distinct');
blkMatrix = blkMatrix - repmat(mean(blkMatrix,1),[patch_size^2, 1 ]);

row = floor(M / patch_size);
col = floor(N / patch_size);   %% ���ٸ���
% patch_num = col*row;

end

