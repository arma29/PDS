% No arquivo car1.wav, observe que um carro passa 
% enquanto uma pessoa diz números e, em
% um determinado momento, 
% um carro passa por ela. Tente retirar o som do carro. 

clc;
clear all;
close all;


[car,Fs] = audioread('car1.wav');



%sound(car,Fs)