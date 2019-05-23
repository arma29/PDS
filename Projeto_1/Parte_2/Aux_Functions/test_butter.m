function [] = test_butter(im,d,n)
%TEST_BUTTER Summary of this function goes here
%   Low pass butterworth
lp=butterlp(im,d,n);

%aplicando a transformada de fourier
%da minha imagem, shifted do centro
af=fftshift(fft2(im));

%convolu��o no espa�o -> 
%multiplica��o no dominio fourier
aflp=af.*lp;

%inversa do filtro
aflpi=ifft2(aflp);
ifftshow(aflpi);
end

