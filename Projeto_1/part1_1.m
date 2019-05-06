clc;
clear all;
close all;
%Utilizando janelamento, crie um filtro FIR passa alta 
%com as seguintes especifica��es
%Para uma dadaespecifica��o de filtro, escolha um filtro de
%comprimento M e uma fun��o janela w[n]
%para a mais estreita largura do l�bulo
%principal e a menor atenua��o nos l�bulos
%laterais poss�vel -> Hamming x Blackman 
%(Hamming � melhor, para da pra ter uma compara��o.

ws = 0.6*pi;
wp = 0.75*pi;
As = 50;


tr_width = wp - ws;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Como � highpass, garantir que M ser� impar.
M_ham = ceil(6.6*pi/tr_width) + 1; %ham

n = [0:M_ham-1];
%Composi��o do filtro para Hamming
%O filtro passa alta pode ser uma composi��o de passabaixas 
%Sendo 0 , de 0 at� wc
%Sendo 1 , de wc at� pi.
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
%Composi��o do filtro para Blackman
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
%Compara��o com ferramenta
Fstop = 0.6;
Fpass = 0.75;
Astop = 50;


d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'DesignMethod','equiripple');

fvtool(d);