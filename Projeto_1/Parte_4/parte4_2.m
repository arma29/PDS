%% Parte 4 - Q2
% Abra o arquivo teste_de_som.wav: 
% 1) verifique sua taxa de amostragem; 
% 2) multiplique o sinal original por 30 adicione 
%     a ele um ruído senoidal na faixa de 466,16 Hz (frequência do Lá sustenido)
%     e plote o sinal original e esse ruidoso; 
% 3) teste filtros FIR e IIR com diferentes parâmetros para
%     tentar extrair esse ruído do sinal gerado no item anterior, 
%     considerando que você não tem a
%     informação sobre o sinal ruidoso. 

clc;
clear all;
close all;

% Em geral, o IIR atinge bons resultados com uma ordem menor
% em relação ao FIR.

%Na prática, para uma frequência de
% amostragem do sinal de 10 kHz, deve-se
% utilizar uma janela da ordem de 100<N<200
% amostras (10 ms < t < 20 ms)
%% Parte1) Fs - sample rate
[teste,Fs] = audioread('teste_de_som.wav');
audio_duration = length(teste)/Fs;
% sound(teste,Fs);
%% Parte2) Multiplicar por 30 e adicionar o lá sustenido
teste_30 = 30*teste;
% Ruído senoidal a partir do lá sustenido
f = 466.16;
% Vetor de duração. 3 segundos / Fs
T = (linspace(0,audio_duration-1/Fs,length(teste)))';
%Ruído do lá sustenido criado
noise = sin(2*pi*f*T);
% sound(noise);
%Sinal modificado
teste_noisy = teste_30 + noise(1:length(noise));
% sound(teste_noisy,Fs);

% Plot signals
figure(1)
subplot(2,1,1); plot(teste); grid on; title('Original Signal');
subplot(2,1,2); plot(teste_noisy); grid on; title('Noisy Signal');

%% Parte3) Filter FIR
% a frequência de corte normalizada será a frequência dividida
% pela frequência de nyquist, que é o Fs/2.
% Logo bons resultados ficaram próximos da frequência de corte 0.11
% O melhor encontrado foi f/Fs/4 -> 0.22
wc = 0.22;
order = 34;

% FIR com janela de Hamming, ordem 34, frequencia de corte 0.22, passa
% alta e janela 35.
f1 = fir1(order , wc, 'high', hamming(order+1));
figure(2), freqz(f1,1); suptitle('Hamming');

out_f1 = filter(f1,1,teste_noisy);
% sound(out_f1,Fs);

% FIR com janela de Blackman, ordem 34, frequencia de corte 0.22, passa
% alta e janela 35.
f2 = fir1(order, wc, 'high',blackman(order+1));
figure(3), freqz(f2,1); suptitle('Blackman');

out_f2 = filter(f2,1,teste_noisy);
% sound(out_f2,Fs);

figure(4)
subplot(2,1,1); plot(T,out_f1); grid on; title('Hamming FIR');
subplot(2,1,2); plot(T,out_f2); grid on; title('Blackman FIR');
% audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\test_fir_ham.wav', out_f1,Fs);
% audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\teste_fir_bla.wav', out_f2,Fs);

%% IIR
order_iir = 7;
% Butterworth de ordem 7, tipo passa alta e frequencia de corte 0.22
[b,a] = butter(order_iir, wc, 'high');
figure(5), freqz(b,a); suptitle('Butteworth');

out_f3 = filter(b,a,teste_noisy);
% sound(out_f3,Fs);

% Chebyshev de ordem 7, tipo passa alta e frequencia de corte 0.22
[b,a] = cheby1(order_iir,1,wc, 'high');
figure(6), freqz(b,a); suptitle('Chebyshev');

out_f4 = filter(b,a,teste_noisy);
sound(out_f4,Fs);

figure(7)
subplot(2,1,1); plot(T,out_f3); grid on; title('Butterworth IIR');
subplot(2,1,2); plot(T,out_f4); grid on; title('Chebyshev IIR');
% audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\test_iir_but.wav', out_f3,Fs);
% audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\teste_iir_che.wav', out_f3,Fs);


