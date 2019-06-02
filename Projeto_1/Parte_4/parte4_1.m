% No arquivo car1.wav, observe que um carro passa 
% enquanto uma pessoa diz números e, em
% um determinado momento, 
% um carro passa por ela. Tente retirar o som do carro. 

clc;
clear all;
close all;

[car,Fs] = audioread('car1.wav');
b = fir1(98,31/80,hanning(99));
filt_sp=filter(b,1,car);
f=0:8000/(127):8000;
subplot(2,1,1)
spect=fft(car,256);
plot(f,abs(spect(1:128))/max(abs(spect(1:128))));
xlabel('frequencia');
subplot(2,1,2);
filt_spect=fft(filt_sp,256);
plot(f,abs(filt_spect(1:128))/max(abs(filt_spect(1:128))));
audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\car1_f.wav',filt_sp,Fs);


%sound(car,Fs);