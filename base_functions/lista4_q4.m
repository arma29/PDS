%{
Lista 4 - Q3
ButterWorth
-1. Achar valores de N e estimar OmegaC.
1. Achar função de mag quadrática, em função de s
2. Achar polos (b = roots(a))
3. Selecionar polos do semiplano esquerdo
4. Achar o ganho unitario, quando s no denominador = 0
5. Aplicar u_buttap
6. aplicar bilinear no retorno de buttap, 
especificando o T(T é a partir da frequencia
da banda de corte (ws) T = 1/f)

Eg.
%}
clc;
close all;
clear all;

rp = 0.15; %passband ripple
rs = 60; %stopband ripple
wp = 1500; %passband freq
ws = 3000; %stopband freq
fs = 7000; %sampling freq

w1 = (2*wp)/fs;
w2 = 2*ws/fs;

[n,wn]=buttord(w1,w2,rp,rs,'s');
[z,p,k] = butter(n,wn);
[b,a] = zp2tf(z,p,k);
[b,a] = butter(n,wn,'s');

w = 0:0.1:pi;
[h,om] = freqs(b,a,w);
m=20*log10(abs(h));
an=angle(h);
subplot(2,1,1); plot(om/pi,m);
ylabel('Gain in dB');
subplot(2,1,2); plot(om/pi,an);
xlabel('Normalised frequency');
ylabel('Phase in radians');




