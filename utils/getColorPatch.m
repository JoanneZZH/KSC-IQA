function blkMatrix = getColorPatch( Image ,patch_size )
% This function is used to patition an image to non-overlapped patches
% Image size: M*N
% Patch size: R*R
% The number of patches: [M/R]*[N/R]   []:х║ил

Image=im2double(Image);
if (length(size(Image))>2)
    I1 = Image(:,:,1);
    I2 = Image(:,:,2);
    I3 = Image(:,:,3);
    [M , N] = size(I1);
%     row = floor(M / patch_size);
    patch_dim = patch_size * patch_size;
    l = floor(M / patch_size) * patch_size;   %length
    w = floor(N / patch_size) * patch_size;   %width
    I11 = I1(1:l, 1:w);
    blkMatrix1 = im2col(I11, [patch_size,patch_size], 'distinct');
    I22 = I2(1:l, 1:w);
    blkMatrix2 = im2col(I22, [patch_size,patch_size], 'distinct');
    I33 = I3(1:l, 1:w);
    blkMatrix3 = im2col(I33, [patch_size,patch_size], 'distinct');
    blkMatrix(1:patch_dim ,:) = blkMatrix1;
    blkMatrix(patch_dim+1:2*patch_dim ,:) = blkMatrix2;
    blkMatrix(2*patch_dim+1:3*patch_dim ,:) = blkMatrix3;
    
else
    [M , N] = size(Image);
    l = floor(M / patch_size) * patch_size;   %length
    w = floor(N / patch_size) * patch_size;   %width
    I = Image(1:l, 1:w);
    blkMatrix = im2col(I, [patch_size,patch_size], 'distinct');
end

end



