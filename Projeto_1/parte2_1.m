clc;
clear all;
close all;

% 2.1. (filtragem) Para a imagem lena_rings.bmp: essa imagem possui um efeito comum a problemas
% de transmiss�o de v�deo chamado de ringings. Filtre a imagem a fim de diminuir (ou remover) o
% efeito. A imagem original (lena.bmp) � fornecida apenas para entendimento do que seria a imagem
% sem ru�do, n�o devendo ser usada na solu��o. 

Lena = imread('lena_rings.bmp');
orig_Lena = imread('lena.bmp');
figure(1)
image(Lena);
figure(2)
image(orig_Lena);