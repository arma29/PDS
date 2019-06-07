% Na imagem dalton.bmp, faça um algoritmo automático 
% que melhore a distinção dos números por um daltônico. 
% Ou seja, você está procurando intensificar o contraste 
% entre números e background ou separar as cores. 

clc;
clear all;
close all;

%tripla matriz
dalton = imread('dalton.bmp');
HSV = rgb2hsv(dalton); %HSV

dalton_r = dalton(:,:,1);
% figure(1), imshow(dalton_r);
% figure(2), imhist(dalton_r);

h_image = HSV(:,:,1);
% figure(2), imshow(h_image);
figure(2), imhist(h_image);

s_image = HSV(:,:,2);
v_image = HSV(:,:,3);

h_image = medfilt2(h_image);

% figure(5), imshow(s_image);
% figure(6), imshow(v_image);
% figure(7), imshow(HSV);

% % 
[pixels,location] = imhist(h_image);

% figure(3), imshow(h_image);
% figure(4), imhist(h_image);

% h_image = imadjust(h_image);
h_image = imadjust(h_image,[0.004 0.33], []);
% h_image = imadjust(h_image,[0.78 1], []);

%all black or white
h_image = im2bw(h_image,0.3);
figure(5), imshow(h_image);
figure(6), imhist(h_image);

rgbcolor = impixel(dalton,211,129);
% figure(1),imhist(dalton(:,:,1));
% figure(2),imhist(dalton(:,:,2));
% figure(3),imhist(dalton(:,:,3));
white_dalton = dalton;

% figure(4),imshow(dalton)
% figure(1),imhist(white_dalton(:,:,1));
% figure(2),imhist(white_dalton(:,:,2));
% figure(3),imhist(white_dalton(:,:,3));
