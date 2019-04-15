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

%Initial
wp = 0.2*pi;
ws = 0.3*pi;

%Epslon and A
epslon = sqrt((1/0.89125) - 1);
A = sqrt(1/0.17783);

%From there we calculate Rp and As
Rp = -10*log10(1/(1+(epslon.^2)));
As = -10*log10(1/(A.^2));

%Finally we can go for N, wc_wp and wc_ws
N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(wp/ws)));
wc_wp = wp/(nthroot((10.^(Rp/10))-1 , 2*N));
wc_ws = ws/(nthroot((10.^(As/10))-1 , 2*N));

%We choose a value between wc_ws and wc_wp
wc_real = 0.8;
wmax = pi;

%TODO
%a= [-4 0 1];
%b = roots(a);
%zplane(b);

%My Buttap
[b,a]=u_buttap(N,wc_real);
Htransfer = tf(b,a)
%Bilinear Transform
%[b,a] = bilinear(b,a,1)

%Book buttap
%[b,a] = afd_butt(wp,ws,Rp,As);
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
title('Phase Response'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Radianos');

subplot(2,2,4); 
plot(t,ha); 
title('Resposta ao Impulso'); grid
xlabel('Tempo em segundos'); 
ylabel('Ha(t)');

suptitle('Filtro analógico Butterworth');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mesmo procedimento para achar o N
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
title('Phase Response'); grid
xlabel('Frequencia Analógica em unidades pi'); 
ylabel('Radianos');

subplot(2,2,4); 
plot(t,ha); 
title('Resposta ao Impulso'); grid
xlabel('Tempo em segundos'); 
ylabel('Ha(t)');

suptitle('Filtro digital Butterworth');

