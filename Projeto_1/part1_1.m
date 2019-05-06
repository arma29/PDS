clc;
clear all;
close all;
%Utilizando janelamento, crie um filtro FIR passa alta 
%com as seguintes especificações
%Para uma dadaespecificação de filtro, escolha um filtro de
%comprimento M e uma função janela w[n]
%para a mais estreita largura do lóbulo
%principal e a menor atenuação nos lóbulos
%laterais possível -> Hamming x Blackman 
%(Hamming é melhor, para da pra ter uma comparação.

ws = 0.6*pi;
wp = 0.75*pi;
As = 50;


tr_width = wp - ws;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Como é highpass, garantir que M será impar.
M_ham = ceil(6.6*pi/tr_width) + 1; %ham

n = [0:M_ham-1];
%Composição do filtro para Hamming
%O filtro passa alta pode ser uma composição de passabaixas 
%Sendo 0 , de 0 até wc
%Sendo 1 , de wc até pi.
wc = (ws+wp)/2;
hd = ideal_lp(pi,M_ham);
hd = hd - ideal_lp(wc,M_ham);

w_ham = (hamming(M_ham))';
h =hd.*w_ham;
[db, mag, pha, w] = freqz_m(h, [1]); 


figure(1)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M_ham-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_ham); title('Janela de Hamming');
axis([0 M_ham-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M_ham-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em unidades pi'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Hamming');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_bla = ceil(11*pi/tr_width) + 1; %blackman

n = [0:M_bla-1];
%Composição do filtro para Blackman
hd = ideal_lp(pi,M_bla);
hd = hd - ideal_lp(wc,M_bla);

w_bla = (blackman(M_bla))';
h = hd.*w_bla;
[db, mag, pha, w] = freqz_m(h, [1]); 


figure(2)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M_bla-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_bla); title('Janela de Blackman');
axis([0 M_bla-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M_bla-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em unidades pi'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Blackman');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comparação com ferramenta
Fstop = 0.6;
Fpass = 0.75;
Astop = 50;


d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'DesignMethod','equiripple');

fvtool(d);