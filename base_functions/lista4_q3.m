clear
wc1 = pi/6;
M = 19;
n = [0:(M-1)];
hd = ideal_lp(wc1,M);
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

%%O da vez
h = h_bla;

[db,mag,pha,w] = freqz_m(h,[1]);

subplot(2,2,1);
stem(n,hd); title('Resposta ao impulso Ideal');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('hd[n]');
subplot(2,2,2); stem(n,w_ham); title('janela de X');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w[n]');
subplot(2,2,3); stem(n,h); title('Resposta ao Impulso Atual');
axis([0 M-1 -0.4 0.5]); xlabel('n'); ylabel('h[n]');
subplot(2,2,4); plot(w/pi,db); title('Magnitude em dB'); grid
axis([0 1 -150 10]); xlabel('Frequencia em pi unidades'); ylabel('Decibeis');