% No arquivo video1.avi, tente gerar um vídeo 
% apenas com os carros que passam (elimine o
% background o máximo que puder). 
% Pode ser apenas a silhueta dos carros.

clc;
clear all;
close all;

vobj = VideoReader('video1.avi');
video = read(v);