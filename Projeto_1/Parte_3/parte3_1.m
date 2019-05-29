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
threshold = 25;

%newvideo
noback_video = video_back(vobj,numFrames,threshold);  

%playing video with same frameraet
frameRate = vobj.FrameRate;
implay(noback_video,frameRate);
