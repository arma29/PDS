% Parte 1 - Q1
% Utilizando janelamento, crie um filtro FIR passa alta 
% com as seguintes especifica��es [...]
% Justifique todas as suas decis�es de projeto. 

clc;
clear all;
close all;

%Para uma dada especifica��o de filtro, escolha um filtro de
%comprimento M e uma fun��o janela w[n]
%para a mais estreita largura do l�bulo
%principal e a menor atenua��o nos l�bulos
%laterais poss�vel -> Hamming x Blackman 
%Hamming � melhor, menos disperd�cio de banda.

ws = 0.6*pi;
wp = 0.75*pi;
As = 50;
tr_width = wp - ws;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Como � highpass, garantir que M ser� impar.
M_ham = ceil(6.6*pi/tr_width) + 1; %ham

%Composi��o do filtro para Hamming
%O filtro passa alta pode ser uma composi��o de passabaixas 
%Sendo 0 , de 0 at� wc
%Sendo 1 , de wc at� pi.
wc = (ws+wp)/2;
hd = ideal_lp(pi,M_ham);
hd = hd - ideal_lp(wc,M_ham);

plot_filter(M_ham, hd, ws, wp, As, 'Hamming', 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_bla = ceil(11*pi/tr_width) + 1; %blackman
%Composi��o do filtro para Blackman
hd = ideal_lp(pi,M_bla);
hd = hd - ideal_lp(wc,M_bla);

plot_filter(M_bla, hd, ws, wp, As, 'Blackman', 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Compara��o com ferramenta
Fstop = 0.6;
Fpass = 0.75;
Astop = 50;

d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'DesignMethod','equiripple');

fvtool(d);