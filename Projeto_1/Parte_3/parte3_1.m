%% Part3 - Q1
% No arquivo video1.avi, tente gerar um vídeo 
% apenas com os carros que passam (elimine o
% background o máximo que puder). 
% Pode ser apenas a silhueta dos carros.

clc;
clear all;
close all;

%% Parâmetros de leitura de video, frames e um limiar, usado no algoritmo
vobj = VideoReader('video1.avi');
numFrames = vobj.NumberOfFrames;
threshold = 100;

%% Definindo e abrindo arquivo
writer = VideoWriter(['C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_3\Util\video_th' num2str(threshold) '.avi'],'Uncompressed AVI');
writer.FrameRate = vobj.FrameRate;
open(writer);

%% Executando o algoritmo completo
% O algoritmo é bem simples, analisa um frame e seu antecessor,
% realiza-se uma subtração deles e apenas mostra os valores que ultrapassam
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


