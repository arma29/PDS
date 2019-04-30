clc;
clear all;
close all;
%Utilizando janelamento, crie um filtro FIR passa alta 
%com as seguintes especificações

ws = 0.6*pi;
wp = 0.75*pi;
As = 50;

Fstop = 350;
Fpass = 400;
Astop = 65;
Apass = 0.5;
Fs = 1e3;

d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'PassbandRipple',Apass,'SampleRate',Fs,'DesignMethod','equiripple');

fvtool(d);