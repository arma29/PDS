
clear

function [x] = HammingBand(tr_width)
   x = 6.6*pi/tr_width;
endfunction

function [x] = BlackmanBand(tr_width)
  x = 11*pi/tr_width;
endfunction



%Parameterst
wp = 0.2*pi;
ws = 0.3*pi;
Rp = 0.25;
As = 50;
tr_width = ws - wp;
M = ceil(HammingBand(tr_width)) + 1;
n = [0:M-1];
%frequencia de corte é a média enter ws e wp
wc = (wp + ws)/2;
%hd = ideal_lp(wc,M);
%%%%
[hda,hdb] = butter(M, wc);
filtered = filter(hda,hdb,n);

w_ham = (hamming(M))';
h = hd.*w_ham;
[db,mag,pha,w] = freqz_plot(h,[1]);
