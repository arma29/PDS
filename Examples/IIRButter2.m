clc;
clear all;
close all;

%Fundamentals of FPB Butterworth filter
Wp = 0.2*pi; 
Ws = 0.3*pi;
Rp = 7; 
As = 16;

Ripple = 10 ^ (-Rp/20); 
Attn = 10 ^ (-As/20);

% Analog filter design:
[b,a] = afd_butt(Wp,Ws,Rp,As);
b
a
%Resposta na frequencia
[db,mag,pha,w] = freqs_m(b,a,0.5*pi);
%Resposta ao impulso
[ha,x,t] = impulse(b,a);

subplot(2,2,1); 
plot(w/pi,mag); 
title('Magnitude Absoluta'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('|H|');

subplot(2,2,2); 
plot(w/pi,db); 
title('Magnitude em dB'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Decibeis');

subplot(2,2,3); 
plot(w/pi,pha); 
title('Phase Response'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Radianos');

subplot(2,2,4); 
plot(t,ha); 
title('Resposta ao Impulso'); grid
xlabel('Tempo em segundos'); 
ylabel('Ha(t)');