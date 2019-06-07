clc;
clear all;
close all;

% 2.1. (filtragem) Para a imagem lena_rings.bmp: essa imagem possui um efeito comum a problemas
% de transmissão de vídeo chamado de ringings. Filtre a imagem a fim de diminuir (ou remover) o
% efeito. A imagem original (lena.bmp) é fornecida apenas para entendimento do que seria a imagem
% sem ruído, não devendo ser usada na solução. 

Lena = imread('lena_rings.bmp');
orig_Lena = imread('lena.bmp');
figure(1)
imshow(Lena);

% figure(2)
% imshow(orig_Lena);

new_Lena = medfilt2(Lena);
% figure(2)
% imshow(kmedian);



% h = fspecial('gaussian');
% lena2 = filter2(h, Lena);
% figure(2)
% imshow(lena2);

new_Lena = test_butter(new_Lena,25,1);
new_Lena = imadjust(new_Lena);


figure(4),imshow(new_Lena);
