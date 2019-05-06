clc;
clear all;
close all;

%Parte 1 - Q2
%  Neste experimento, você usará o arquivo sp04.wav. Considere que esse arquivo é sua entrada
% x[n]. Considere D um atraso. Gere um sinal de eco com sua entrada e esse atraso. Ou seja, crie
% um sinal x2[n] = x[n] + 0.5x[n – D]. Considere, por exemplo, D = 500 amostras para ter uma melhor
% percepção do eco. 

D = 500;

%Read audio file
[y,Fs] = audioread('sp04.wav');
len_y = length(y);

%Generate Eco
for n = 1:len_y
    %Need transpose the signal
    if(n > D)
        y2(n,1) = y(n) + 0.5*(y(n-D)); 
    else
        y2(n,1) = y(n);
    end
    
end

%y2 = y2';

figure(1)
plot(y); grid on; title('Sinal Original');
figure(2)
plot(y2); grid on; title('Sinal com Eco');

%Play the audio
sound(y2,Fs);


%sound(y,Fs);

