%% Parte 2 - Q3
% Na imagem dalton.bmp, faça um algoritmo automático 
% que melhore a distinção dos números por um daltônico. 
% Ou seja, você está procurando intensificar o contraste 
% entre números e background ou separar as cores. 

clc;
clear all;
close all;

%tripla matriz
dalton = imread('dalton.bmp');

%% Conversão de ida: RGB -> HSV
HSV = rgb2hsv(dalton); %HSV

% Componentes HSV da nova imagem
h_image = HSV(:,:,1);
s_image = HSV(:,:,2);
v_image = HSV(:,:,3);

%% Aqui o número é isolado do background
% Uma vez feito isso, basta binarizar a imagem para a correspondente
% Esta função redistribui a concentração de pixels sobre todos os outros
for i=1:size(h_image,1)
    for j=1:size(h_image,2)
        %Primeiro, transforma branco -> preto
        if(h_image(i,j) > 0.9)
            h_image(i,j) = 0;
        end
        %Segundo, faixas cinzas -> branco (background)
        if(h_image(i,j) < 0.2 && h_image(i,j) > 0.1)
            h_image(i,j) = 1;
        end
        %Por fim, remover parcelas resiudais -> branco
        if(h_image(i,j) < 0.9 && h_image(i,j) > 0.3)
            h_image(i,j) = 1;
        end  
    end
end   
% Redistribuir pixels da faixa escura
h_image = imadjust(h_image,[0.12 0.21],[]);

% Binarização manual final, o que for próximo de branco -> branco
% Do contrário sera preto absoluto
% todos os componentes do HSV foram usados para a conversão
% Normalização:
% HSV(0,0,1) -> RGB(1,1,1); 
% HSV(0,0,0) -> RGB(0,0,0);
lim = 0.9;
for i=1:size(h_image,1)
    for j=1:size(h_image,2)
        if(h_image(i,j) < lim)
            h_image(i,j) = 0;
            s_image(i,j) = 0;
            v_image(i,j) = 0;
        else
            h_image(i,j) = 0;
            s_image(i,j) = 0;
            v_image(i,j) = 1;
        end
        
    end
end    

%% Processo de volta para RGB
HSV(:,:,1) = h_image;
HSV(:,:,2) = s_image;
HSV(:,:,3) = v_image;
dalton_back = hsv2rgb(HSV);
imshow(dalton_back);


