function [ret] = test_butter(im,d,n)
%TEST_BUTTER Summary of this function goes here
%   Dado a imagem im
%   Frequencia de corte d
%   ordem do filtro n
%   retorna a imagem apos um FPB sobre ela


%   Low pass butterworth

lp=butterlp(im,d,n);

%aplicando a transformada de fourier
%da minha imagem, shifted do centro
af=fftshift(fft2(im));

%convolução no espaço -> 
%multiplicação no dominio fourier
aflp=af.*lp;

%inversa do filtro
aflpi=ifft2(aflp);

%Mostra a imagem
ret = ifftshow(aflpi);
end

