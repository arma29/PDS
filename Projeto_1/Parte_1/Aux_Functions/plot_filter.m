function plot_filter(M,hd, ws, wp, As, windowName,count)
%PLOT_FILTER Summary of this function goes here
%   Detailed explanation goes here
%   Recieve M value, hd filter as parameters
%   ws , wp, As for graphical lines
%   windowName and count for graphical purposes.
%   plot 4 graphics

n = [0:M-1];
w_filter = (hamming(M))';
h =hd.*w_filter;
[db, mag, pha, w] = freqz_m(h, [1]); 


figure(count)
subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_filter); title(['Janela de ' windowName]);
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid minor;
axis ([0 1 -150 10]); xlabel('Frequencia em unidades pi'); ylabel('Decibeis'); 
yline(-As,'-.r', 'As'); xline(ws/pi,'-.r', 'ws'); xline(wp/pi,'-.r','wp');
suptitle(['Respostas do filtro passa-alta com janela de ' windowName]);
end

