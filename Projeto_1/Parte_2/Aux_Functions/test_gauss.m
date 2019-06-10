function [ret] = test_gauss(im,factor)
%TEST_GAUSS Summary of this function goes here
%   Given im - image , factor - sigma
%   Return the filtered image
%   Low pass gauss

h=size(im,1);
g=fspecial('gaussian',256,factor);

%aplicando a transformada de fourier
%da minha imagem, shifted do centro
af=fftshift(fft2(im));

%suavizando
g1=mat2gray(g);
ag=af.*g1;

%Inversa da transformada
aginv=ifft2(ag);

%Auxiliar para Mostrar a imagem

ret = ifftshow(aginv);

end

