% No arquivo video1.avi, tente gerar um vídeo 
% apenas com os carros que passam (elimine o
% background o máximo que puder). 
% Pode ser apenas a silhueta dos carros.

clc;
clear all;
close all;

%parameters
vobj = VideoReader('video1.avi');
numFrames = vobj.NumberOfFrames;
threshold = 100;

%Definindo e abrindo arquivo
writer = VideoWriter(['C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_3\Util\video_th' num2str(threshold) '.avi'],'Uncompressed AVI');
writer.FrameRate = vobj.FrameRate;
open(writer);

%Executando o algoritmo completo
noback_video = video_back(vobj,numFrames,threshold);

%Salvando e fechando o arquivo
writeVideo(writer,noback_video);
close(writer);

%playing video with same frameraet
% frameRate = vobj.FrameRate;
% implay(noback_video,frameRate);


