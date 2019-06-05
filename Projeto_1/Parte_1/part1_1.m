% Parte 1 - Q1
% Utilizando janelamento, crie um filtro FIR passa alta 
% com as seguintes especificações [...]
% Justifique todas as suas decisões de projeto. 

clc;
clear all;
close all;

%Para uma dada especificação de filtro, escolha um filtro de
%comprimento M e uma função janela w[n]
%para a mais estreita largura do lóbulo
%principal e a menor atenuação nos lóbulos
%laterais possível -> Hamming x Blackman 
%Hamming é melhor, menos disperdício de banda.

ws = 0.6*pi;
wp = 0.75*pi;
As = 50;
tr_width = wp - ws;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Como é highpass, garantir que M será impar.
M_ham = ceil(6.6*pi/tr_width) + 1; %ham

%Composição do filtro para Hamming
%O filtro passa alta pode ser uma composição de passabaixas 
%Sendo 0 , de 0 até wc
%Sendo 1 , de wc até pi.
wc = (ws+wp)/2;
hd = ideal_lp(pi,M_ham);
hd = hd - ideal_lp(wc,M_ham);

plot_filter(M_ham, hd, ws, wp, As, 'Hamming', 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_bla = ceil(11*pi/tr_width) + 1; %blackman
%Composição do filtro para Blackman
hd = ideal_lp(pi,M_bla);
hd = hd - ideal_lp(wc,M_bla);

plot_filter(M_bla, hd, ws, wp, As, 'Blackman', 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comparação com ferramenta
Fstop = 0.6;
Fpass = 0.75;
Astop = 50;

d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'DesignMethod','equiripple');

fvtool(d);