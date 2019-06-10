%% Parte 2 - Q2 
% Na imagem alumgrns.bmp, faça um algoritmo 
% para contar automaticamente quantas regiões
% de diferentes texturas existem na imagem. 

clc;
clear all;
close all;

alumgnrs = imread('alumgrns.bmp');
% O filtro da mediana elimina valores discrepantes,
% suavizando a image -> substitui intensidade do pixel pela média dos seus
% vizinhos
alumgnrs = medfilt2(alumgnrs);

%% Abordagem por divisão de tons em grupos
% O grupo que possuir um membro com quantidade de pixels superior a X
% será um grupo válido
% do contrário, não será contabilizado.
[numPixels,binsLocation]= imhist(alumgnrs);

% Contagem de texturas para:
lim1 = 100
lim2 = 200
% 64 grupos de 4 bits, X = 100
out_4 = percep_count(numPixels,4,lim2)
% 32 grupos de 8 bits, X = 50
out_8 = percep_count(numPixels,8,lim1)
figure(4), imhist(alumgnrs); yline(lim1, '-.r', '8 bits limit'); yline(lim2, '-.b', '4 bits limit');


%% Binarização (manual) com o gradiente da imagem
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
% pegamos o parâmetro NumObjects que retornará o número de regiões.
out_regions = bwconncomp(G_alu);
out_regions = out_regions.NumObjects;

%% Abordagem com o complemento da imagem -> Watershed + Binarização
% O complemento da imagem se mostrou mais útil na abordagem
I_comp = imcomplement(alumgnrs);
% É necessário uma compressão da imagem obtida
% Pois sem, ela trará uma quantidade mais definidas de regiões
% O que não é o que se deseja.
I_supress = imhmin(I_comp, 5.5);
W_alu = watershed(I_supress);

% É importante ressaltar que o vetor fornecido na função
% altera a quantidade de regiões
% Ele representa a cor da linha que divide os elementos
% quanto mais escura, mais definida é e mais separados os objetos estarão.
% Aqui convertemos a matriz retornada pelo watershed em imagem RGB.
R_alu = label2rgb(W_alu, 'cool', [0 0 0]);
figure(2), imshow(R_alu);

% Para o uso da função de contagem de objetos
% É necessário converter a imagem de rgb -> gray
% e de gray -> bw, ou seja, tudo preto ou branco.
grey = rgb2gray(R_alu);
bw = imbinarize(grey);
% figure(3), imshow(bw);

% O resultado final aparece na struct out_regions
% pegamos o parâmetro NumObjects que retornará o número de regiões.
out_regions2 = bwconncomp(bw);
out_regions2 = out_regions2.NumObjects;

figure(2), imshow(bw);

%% Binarização adpatada e direta
% Converte a imagem grayscale para binária com threshold adaptativo
b_alumgnrs = imbinarize(alumgnrs, 'adaptive'); 
figure(3), imshow(b_alumgnrs);
out_regions3 = bwconncomp(b_alumgnrs);
out_regions3 = out_regions3.NumObjects;




