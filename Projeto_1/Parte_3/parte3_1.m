%% Part3 - Q1
% No arquivo video1.avi, tente gerar um v�deo 
% apenas com os carros que passam (elimine o
% background o m�ximo que puder). 
% Pode ser apenas a silhueta dos carros.

clc;
clear all;
close all;

%% Par�metros de leitura de video, frames e um limiar, usado no algoritmo
vobj = VideoReader('video1.avi');
numFrames = vobj.NumberOfFrames;
threshold = 100;

%% Definindo e abrindo arquivo
writer = VideoWriter(['C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_3\Util\video_th' num2str(threshold) '.avi'],'Uncompressed AVI');
writer.FrameRate = vobj.FrameRate;
open(writer);

%% Executando o algoritmo completo
% O algoritmo � bem simples, analisa um frame e seu antecessor,
% realiza-se uma subtra��o deles e apenas mostra os valores que ultrapassam
% O limiar (threshold)
% I.e : |Image(x,y,index) - Image(x,y,index-1)| > threshold
% Variando-se o threshold, obtemos diferentes resultados
noback_video = video_back(vobj,numFrames,threshold);

%% Salvando e fechando o arquivo
writeVideo(writer,noback_video);
close(writer);

%% playing video with same frameraet
frameRate = vobj.FrameRate;
implay(noback_video,frameRate);


