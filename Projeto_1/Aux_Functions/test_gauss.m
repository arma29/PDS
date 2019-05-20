function [] = test_gauss(im,factor)
%TEST_GAUSS Summary of this function goes here
%   Low pass gauss
h=size(im,1);
g=fspecial('gaussian',256,factor);
af=fftshift(fft2(im));

g1=mat2gray(g);
ag=af.*g1;

aginv=ifft2(ag);
ifftshow(aginv);
end

