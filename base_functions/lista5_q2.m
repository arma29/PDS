clc;
clear all;
close all;

n = 0:99;
fs = 200; %sample
Ts = 1/fs; %Period

y = sin(2*pi*20*n*Ts) + cos(2*pi*30*n*Ts);
z = sin(2*pi*40*n*Ts) + cos(2*pi*60*n*Ts);

w = [y z];

%a) DFT de y(n) magnitude e fase (plus seq)
Y = fft(y);
m = 0:length(Y)-1;
figure(1)
subplot(3,1,1);stem(y);xlabel('n');ylabel('y(n)');title('Sequencia');
subplot(3,1,2);stem(m*fs/length(Y), abs(Y), 'b'); ylabel('magnitude'); 
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(Y), angle(Y), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase'); 
suptitle('DFT y(n)')

%b) DFT de z(n) magnitude e fase (plus seq)
Z = fft(z);
m = 0:length(Z)-1;
figure(2)
subplot(3,1,1);stem(z);xlabel('n');ylabel('z(n)');title('Sequencia');
subplot(3,1,2);stem(m*fs/length(Z), abs(Z), 'b'); ylabel('magnitude'); 
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(Z), angle(Z), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase'); 
suptitle('DFT z(n)')

%c) DFT de w(n) magnitude e fase (plus seq)
W = fft(w);
m = 0:length(W)-1;
figure(3)
subplot(3,1,1);stem(w);xlabel('n');ylabel('w(n)');title('Sequencia');
subplot(3,1,2);stem(m*fs/length(W), abs(W), 'b'); ylabel('magnitude'); 
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(W), angle(W), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase'); 
suptitle('DFT w(n)')

%e) Spec
figure (4)
%specgram(a,nfft,Fs,window,noverlap)
%192 - sobreposição
%256 - janela
%1024 - nfft - tamanho do FFT que o specgrama usa.
%
[B,f,t] = specgram(w,1024,fs,256,192);
% calculate amplitude 50dB down from maximum
bmin=max(max(abs(B)))/300;
% plot top 50dB as image
imagesc(t,f,20*log10(max(abs(B),bmin)/bmin));
% label plot
axis xy; xlabel('Time (s)'); ylabel('Frequency (Hz)');
colormap(jet); 
