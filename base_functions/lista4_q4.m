clc;
close all;
clear all;

%Frequencias
wp = 0.2*pi;
ws = 0.3*pi;

%Epslon e A
epslon = sqrt((1/0.89125) - 1);
A = sqrt(1/0.17783);

%A partir dai temos Rp e As
Rp = -10*log10(1/(1+(epslon.^2)));
As = -10*log10(1/(A.^2));

%Calculamos N, wc para wp e wc para ws
N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(wp/ws)));
wc_wp = wp/(nthroot((10.^(Rp/10))-1 , 2*N));
wc_ws = ws/(nthroot((10.^(As/10))-1 , 2*N));

%Escolhemos um valor entre os dois
wc_real = 0.8;
wmax = pi;

%My Buttap
[b,a]=u_buttap(N,wc_real);
Htransfer = tf(b,a)

%Resposta na frequencia
[db,mag,pha,w] = freqs_m(b,a,wmax);
%Resposta ao impulso
[ha,x,t] = impulse(b,a);

figure(2)
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
title('Resposta de Fase'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Radianos');

subplot(2,2,4); 
plot(t,ha); 
title('Resposta ao Impulso'); grid
xlabel('Tempo em segundos'); 
ylabel('Ha(t)');

suptitle('Filtro analógico Butterworth');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Transformada Bilinear
[b,a] = bilinear(b,a,1)
Htransfer2 = tf(b,a);

[db,mag,pha,w] = freqs_m(b,a,wmax);
[ha,x,t] = impulse(b,a);

figure(3)
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
title('Resposta de Fase'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Radianos');

subplot(2,2,4); 
plot(t,ha); 
title('Resposta ao Impulso'); grid
xlabel('Tempo em segundos'); 
ylabel('Ha(t)');

suptitle('Filtro digital Butterworth');

