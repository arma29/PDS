clc;
clear all;
close all;

% Na imagem alumgrns.bmp, faça um algoritmo 
% para contar automaticamente quantas regiões
% de diferentes texturas existem na imagem. 

% O filtro da mediana elimina valores discrepantes,
% suavizando a image -> substitui intensidade do pixel pela média dos seus
% vizinhos

alumgnrs = imread('alumgrns.bmp');

imfilt = medfilt2(alumgnrs);

% figure(1); imshow(alumgnrs);
% figure(2), imshow(imfilt);
figure(3), imhist(alumgnrs);
figure(4), imhist(imfilt);

[numPixels,binsLocation]= imhist(alumgnrs);
[numPixelsFilt,binsLocationFilt] = imhist(imfilt);

mean_before = mean(numPixelsFilt);
std_before = std(numPixelsFilt);
% 
% count = 1;
% new_numPixels = [];
% new_binsLocation = [];
% for n = 1:length(numPixels)
%     if(numPixels(n) > 0)
%         new_numPixels(count,1) = numPixels(n,1);
%         new_binsLocation(count,1) = n;
%         count = count+1;
%     end
% end

% mean = mean(new_numPixels);
% std = std(new_numPixels);
% figure(1); imhist(alumgnrs); yline(mean, '-.r', 'mean');

% figure(2); plot(new_binsLocation, new_numPixels);

% Drastic changes like background - no
% out = regions_count(new_numPixels,150);

% More useful
out2 = percep_count(numPixelsFilt,8,150)



% teste = imread('teste.bmp');
% figure(3); imhist(teste);

