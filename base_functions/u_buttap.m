function[b,a] = u_buttap(N, omegac)
% b = numerator polynomial coefficients of Ha(s)
% a = denominator polynomial coefficients of Ha(s)
% N = Order of the Butterworth Filter
% Omegac = Cutoff frequency in radians/sec
[z,p,k] = buttap(N);

figure(1)
zplane(p,z);

p = p*omegac;
k = k*omegac^N;
B=real(poly(z));
b0 = k;
b0
b = k*B;
a = real(poly(p));