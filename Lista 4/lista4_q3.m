clc;
clear all;
close all;

%Frequ�ncia de Corte
wc1 = pi/6;

%M escolhido, mesmo para todos, a fim de compara��o
M = 120;
n = [0:(M-1)];

%A composi��o dos filtros � a mesma para todos
%Muda-se os tipos de janela
hd = ideal_lp(wc1,M);

%Fun��es janela Retangular, Bartlet, Hanning, Hamming e Blackman
%Respectivamente
w_rect = (rectwin(M))';
w_bar = (bartlett(M))';
w_hann = (hanning(M))';
w_ham = (hamming(M))';
w_bla = (blackman(M))';

h_rect = hd.*w_rect;
h_bar = hd.*w_bar;
h_hann = hd.*w_hann;
h_ham = hd.*w_ham;
h_bla = hd.*w_bla;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = h_rect;
[db,mag,pha,w] = freqz_m(h,[1]);

figure(1)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_rect); title('Janela Retangular');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela Retangular')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = h_bar;
[db,mag,pha,w] = freqz_m(h,[1]);

figure(2)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_bar); title('Janela de Bartlet');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor
axis ([0 1 -150 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Bartlet')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = h_ham;
[db,mag,pha,w] = freqz_m(h,[1]);

figure(3)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_ham); title('Janela de Hamming');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -175 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Hamming')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = h_hann;
[db,mag,pha,w] = freqz_m(h,[1]);

figure(4)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_hann); title('Janela de Hanning');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Hanning')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = h_bla;
[db,mag,pha,w] = freqz_m(h,[1]);

figure(5)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_bla); title('Janela de Blackman');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');
suptitle('Respostas do filtro passa-baixa com janela de Blackman')