%% Parte 4 - Q1
% No arquivo car1.wav, observe que um carro passa 
% enquanto uma pessoa diz números e, em
% um determinado momento, 
% um carro passa por ela. Tente retirar o som do carro. 

clc;
clear all;
close all;

%% Ideia de analisar parte dos subarrays
% Retirar amplitude ou frequencia

[car,Fs] = audioread('car1.wav');
car_copy = car;
audio_duration = length(car)/Fs;
T = (linspace(0,audio_duration-1/Fs,length(car)))';

% Um FIR hamming passa baixa para eliminar os gaps 
order = 34;
b = fir1(order, [0.44 0.45], 'bandpass', hamming(order+1));

% Setup manual dos gaps
vet1 = (1:15)';
vet2 = (1:15)';

vet1(1) = 1;
vet2(1) = 6500;
vet1(2) = 9500;
vet2(2) = 17200;
vet1(3) = 20000;
vet2(3) = 27500;
vet1(4) = 32000;
vet2(4) = 40000;
vet1(5) = 43000;
vet2(5) = 51200;
vet1(6) = 53500;
vet2(6) = 61800;
vet1(7) = 66500;
vet2(7) = 74000;
vet1(8) = 77500;
vet2(8) = 85500;
vet1(9) = 88500;
vet2(9) = 97000;
vet1(10) = 101000;
vet2(10) = 109000;
vet1(11) = 112000;
vet2(11) = 118000;
vet1(12) = 122000;
vet2(12) = 129500;
vet1(13) = 133000;
vet2(13) = 141000;
vet1(14) = 146500;
vet2(14) = 153800;
vet1(15) = 158000;
vet2(15) = size(car,1)-1;

% Aplicação do filtro a cada subtrecho e o retorno do trecho ao áudio
% original.
for n = 1:size(vet1,1)
      sub_car = car(vet1(n):vet2(n));
      sub_car_f = filter(b,1,sub_car);
      car(vet1(n):vet2(n)) = sub_car_f;
%       fprintf("n %d: %d - %d\n", n, vet1(n), vet2(n)); 
end

% Nova ideia agora é reduzir a sobreposição de voz e som do carro com o
% filtro butterworth, lowpass e de ordem 15.
[b,a] = butter(15, 0.8 , 'low');
% Trecho problemático do número 8
sub_car = car(80000:94000);
sub_car_f = filter(b,a,sub_car);
car(80000:94000) = sub_car_f;

% Trecho problemático dos números 11 e 12.
sub_car = car(113000:136000);
sub_car_f = filter(b,a,sub_car);
car(113000:136000) = sub_car_f;


figure(1)
subplot(2,1,1), plot(car_copy); title('Original Signal');
subplot(2,1,2), plot(car); title('Filtered Signal');
% sound(car,Fs);

% audiowrite('C:\Users\Arnaldo\Documents\PDS\Projeto_1\Parte_4\Util\car_filtered.wav', car,Fs);

