% Abra o arquivo teste_de_som.wav: 
% 1) verifique sua taxa de amostragem; 
% 2) multiplique o sinal original por 30 adicione 
%     a ele um ruído senoidal na faixa de 466,16 Hz (frequência do Lá sustenido)
%     e plote o sinal original e esse ruidoso; 
% 3) teste filtros FIR e IIR com diferentes parâmetros para
%     tentar extrair esse ruído do sinal gerado no item anterior, 
%     considerando que você não tem a
%     informação sobre o sinal ruidoso. 

%Na prática, para uma frequência de
% amostragem do sinal de 10 kHz, deve-se
% utilizar uma janela da ordem de 100<N<200
% amostras (10 ms < t < 20 ms)
clc;
clear all;
close all;

%Parte1) Fs - sample rate
[teste,Fs] = audioread('teste_de_som.wav');
audio_duration = length(teste)/Fs;
% sound(teste,Fs);
%-------------------------------------------------------------------------%
%Parte2) multiply by 30
teste_30 = 30*teste;
% sound(teste_30,Fs);

%Sinuidal Noise
f = 466.16;
T = (linspace(0,audio_duration-1/Fs,length(teste)))'; %vencedor ou
T2 = ((0:length(teste)-1)/Fs)';
noise = sin(2*pi*f*T);
% sound(noise);

% T2 = (0:(audio_duration*Fs)-1)'; %não assim
% noise2 = sin(2*pi*f*T2);
% sound(noise);

% figure(1); plot(T,noise);
% figure(2); plot(T2,noise2);


% ver = rand(1,length(teste))';

teste_noisy = teste_30 + noise(1:length(noise));
% sound(teste_noisy,Fs);


% %plot signals
% figure(1)
% subplot(2,1,1); plot(teste); grid on; title('Original Signal');
% subplot(2,1,2); plot(teste_noisy); grid on; title('Noisy Signal');


%-------------------------------------------------------------------------%
%Parte3) Filter FIR
wc = 2*0.117;
band = [0.8/3 1.8/3];

f1 = fir1(34 , wc, 'high', chebwin(35,40));
out_f1 = filter(f1,1,teste_noisy);

figure(2)
subplot(2,1,1); plot(T2,teste); grid on; title('Original Signal');
subplot(2,1,2); plot(T2,out_f1); grid on; title('Filtered Signal');

% sound(out_f1,Fs);

f2 = fir1(40,band);
out_f2 = filter(f2,1,teste_noisy);

figure(3)
subplot(2,1,1); plot(T2,teste); grid on; title('Original Signal');
subplot(2,1,2); plot(T2,out_f2); grid on; title('Filtered Signal');

% IIR

[b,a] = butter(3, band);
out_f3 = filter(b,a,teste_noisy);

figure(4)
subplot(2,1,1); plot(T2,teste); grid on; title('Original Signal');
subplot(2,1,2); plot(T2,out_f3); grid on; title('Filtered Signal');

[b,a] = cheby1(3,1,band);
out_f4 = filter(b,a,teste_noisy);

figure(5)
subplot(2,1,1); plot(T2,teste); grid on; title('Original Signal');
subplot(2,1,2); plot(T2,out_f4); grid on; title('Filtered Signal');


