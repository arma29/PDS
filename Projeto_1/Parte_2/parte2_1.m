%% Parte 2 - Q1 (filtragem) 
% Para a imagem lena_rings.bmp: essa imagem possui um efeito comum a problemas
% de transmissão de vídeo chamado de ringings. Filtre a imagem a fim de diminuir (ou remover) o
% efeito. A imagem original (lena.bmp) é fornecida apenas para entendimento do que seria a imagem
% sem ruído, não devendo ser usada na solução. 

clc;
clear all;
close all;

%Leitura da imagem
Lena = imread('lena_rings.bmp');
% orig_Lena = imread('lena.bmp');
figure(1); imshow(Lena);

%% Aplicando o filtro Butter, de ordem 1 e frequencia de corte 25.
new_Lena = test_butter(Lena,25,1);
new_Lena = imadjust(new_Lena);
figure(2),imshow(new_Lena);

%% Aplicando o filtro gaussiano de sigma 25.
new_Lena2 = test_gauss(Lena,25);
new_Lena2 = imadjust(new_Lena2);
figure(3), imshow(new_Lena2);


