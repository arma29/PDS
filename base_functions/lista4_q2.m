clc;
clear all;
close all;

%Frequências de corte
wc1 = 0.3*pi;
wc2 = 0.4*pi;
wc3 = 0.5*pi;
wc4 = 0.6*pi;

%Atenuação e Ripple
As = 50;
Rp = 0.5;

%Como não foi especificado a largura de banda, escolhemos o M
%De maneira que ultrapasse a atenuação de 50db
%No gráfico de magnitude
M = 120;

%Composição do filtro por funções do filtro ideal
%Que satisfazem a resposta em frequência dada
hd = ideal_lp(pi,M)+ideal_lp(wc3,M) - ideal_lp(wc4,M);
hd = hd + ideal_lp(wc1,M) - ideal_lp(wc2,M);
n = [0:(M-1)];

w_ham = (hamming(M))';
h = hd.*w_ham;

[db,mag,pha,w] = freqz_m(h,[1]);

figure(1)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_ham); title('Janela de Hamming');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em unidades pi'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Hamming');