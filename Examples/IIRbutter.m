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