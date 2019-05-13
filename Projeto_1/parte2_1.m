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
image(Lena);
figure(2)
image(orig_Lena);