%% Parte 2 - Q2 
% Na imagem alumgrns.bmp, fa�a um algoritmo 
% para contar automaticamente quantas regi�es
% de diferentes texturas existem na imagem. 

clc;
clear all;
close all;

alumgnrs = imread('alumgrns.bmp');
% O filtro da mediana elimina valores discrepantes,
% suavizando a image -> substitui intensidade do pixel pela m�dia dos seus
% vizinhos
alumgnrs = medfilt2(alumgnrs);

%% Abordagem por divis�o de tons em grupos
% O grupo que possuir um membro com quantidade de pixels superior a X
% ser� um grupo v�lido
% do contr�rio, n�o ser� contabilizado.
[numPixels,binsLocation]= imhist(alumgnrs);

% Contagem de texturas para:
lim1 = 100
lim2 = 200
% 64 grupos de 4 bits, X = 100
out_4 = percep_count(numPixels,4,lim2)
% 32 grupos de 8 bits, X = 50
out_8 = percep_count(numPixels,8,lim1)
figure(4), imhist(alumgnrs); yline(lim1, '-.r', '8 bits limit'); yline(lim2, '-.b', '4 bits limit');


%% Binariza��o (manual) com o gradiente da imagem
% Obter o gradiente da imagem
G_alu = imgradient(alumgnrs);
limiar = 101;
for n =1:size(G_alu,1)
    for k = 1:size(G_alu,2)
        if(G_alu(n,k) < limiar)
            G_alu(n,k) = 0;
        else
            G_alu(n,k) = 255;
        end
    end
end    
figure(1), imshow(G_alu,[]);
% O resultado final aparece na struct out_regions
% pegamos o par�metro NumObjects que retornar� o n�mero de regi�es.
out_regions = bwconncomp(G_alu);
out_regions = out_regions.NumObjects;

%% Abordagem com o complemento da imagem -> Watershed + Binariza��o
% O complemento da imagem se mostrou mais �til na abordagem
I_comp = imcomplement(alumgnrs);
% � necess�rio uma compress�o da imagem obtida
% Pois sem, ela trar� uma quantidade mais definidas de regi�es
% O que n�o � o que se deseja.
I_supress = imhmin(I_comp, 5.5);
W_alu = watershed(I_supress);

% � importante ressaltar que o vetor fornecido na fun��o
% altera a quantidade de regi�es
% Ele representa a cor da linha que divide os elementos
% quanto mais escura, mais definida � e mais separados os objetos estar�o.
% Aqui convertemos a matriz retornada pelo watershed em imagem RGB.
R_alu = label2rgb(W_alu, 'cool', [0 0 0]);
figure(2), imshow(R_alu);

% Para o uso da fun��o de contagem de objetos
% � necess�rio converter a imagem de rgb -> gray
% e de gray -> bw, ou seja, tudo preto ou branco.
grey = rgb2gray(R_alu);
bw = imbinarize(grey);
% figure(3), imshow(bw);

% O resultado final aparece na struct out_regions
% pegamos o par�metro NumObjects que retornar� o n�mero de regi�es.
out_regions2 = bwconncomp(bw);
out_regions2 = out_regions2.NumObjects;

figure(2), imshow(bw);

%% Binariza��o adpatada e direta
% Converte a imagem grayscale para bin�ria com threshold adaptativo
b_alumgnrs = imbinarize(alumgnrs, 'adaptive'); 
figure(3), imshow(b_alumgnrs);
out_regions3 = bwconncomp(b_alumgnrs);
out_regions3 = out_regions3.NumObjects;




