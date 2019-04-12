function[b,a] = u_buttap(N, omegac)
[z,p,k] = buttap(N);
p = p*omegac;
k = k*omegac^N;
B=real(poly(z));
b0 = k;
b = k*B;
a = real(poly(p));