clc;
clear all;
close all;

%Parte 1 - Q2
%  Neste experimento, você usará o arquivo sp04.wav. Considere que esse arquivo é sua entrada
% x[n]. Considere D um atraso. Gere um sinal de eco com sua entrada e esse atraso. Ou seja, crie
% um sinal x2[n] = x[n] + 0.5x[n – D]. Considere, por exemplo, D = 500 amostras para ter uma melhor
% percepção do eco. 

D = 2500;
alpha = 0.5

%Read audio file
[y,Fs] = audioread('sp04.wav');

%Generate Eco 1
for n = 1:length(y)
    %Need transpose the signal
    if(n > D)
        y2(n,1) = y(n) + 0.5*(y(n-D)); 
    else
        y2(n,1) = y(n);
    end
    
end


%Alpha vector
vec_a = [0.5 0.9 0.25];
vec_a_neg = [-0.5 -0.9 -0.25]

x = add_echo(y,alpha,D);
% sound(x,Fs); pause(3);
% TODO: asdsd
w = remove_echo(x,vec_a(1),D);
% sound(w,Fs);

plot_wavs(y,alpha,D,1);
plot_diff_wavs(x,vec_a,D,2);
plot_diff_wavs(x,vec_a_neg,D,3);


