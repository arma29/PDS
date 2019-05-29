% Na imagem dalton.bmp, faça um algoritmo automático 
% que melhore a distinção dos números por um daltônico. 
% Ou seja, você está procurando intensificar o contraste 
% entre números e background ou separar as cores. 

clc;
clear all;
close all;

%tripla matriz
dalton = imread('dalton.bmp');
rgbcolor = impixel(dalton,211,129);
% figure(1),imhist(dalton(:,:,1));
% figure(2),imhist(dalton(:,:,2));
% figure(3),imhist(dalton(:,:,3));
white_dalton = dalton;
for i=1:size(dalton,1)
    for j=1:size(dalton,2)
%         white_dalton(i,j,:) = [255 255 255];
        
%         gsc = 0.3*dalton(i,j,1)+0.59*dalton(i,j,2)+0.11*dalton(i,j,3);
%         dalton(i,j,2) = gsc;
%         dalton(i,j,3) = gsc;
        if dalton(i,j,1) > 60 && dalton(i,j,1) < 200
            dalton(i,j,1)= 0;
        end
        if dalton(i,j,2) > 50 && dalton(i,j,2) < 200
            dalton(i,j,2)= 0;
        end
        if dalton(i,j,3) > 60 && dalton(i,j,3) < 150
            dalton(i,j,3)= 0;
        end

        
    end
end

figure(4),imshow(dalton)
% figure(1),imhist(white_dalton(:,:,1));
% figure(2),imhist(white_dalton(:,:,2));
% figure(3),imhist(white_dalton(:,:,3));
% 
