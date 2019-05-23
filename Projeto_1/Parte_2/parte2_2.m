clc;
clear all;
close all;

% Na imagem alumgrns.bmp, faça um algoritmo 
% para contar automaticamente quantas regiões
% de diferentes texturas existem na imagem. 

alumgnrs = imread('alumgrns.bmp');
% figure(1); imshow(alumgnrs);
teste = imread('teste.bmp');

[numPixels,binsLocation]= imhist(alumgnrs);

mean_before = mean(numPixels);
std_before = std(numPixels);

count = 1;
new_numPixels = [];
new_binsLocation = [];
for n = 1:length(numPixels)
    if(numPixels(n) > 0)
        new_numPixels(count,1) = numPixels(n,1);
        new_binsLocation(count,1) = n;
        count = count+1;
    end
end

mean = mean(new_numPixels);
std = std(new_numPixels);
figure(1); imhist(alumgnrs); yline(mean, '-.r', 'mean');

% count2 = 0;
% isDecrescent = true;
% isCrescent = false;
% if(new_numPixels(2) >= new_numPixels(1))
%     isCrescent = true;
%     isDecrescent = false;
% else
%     isCrescent = false;
%     isDecrescent = true;
% end
%     
% for n = 2:length(new_numPixels)
%     if(new_numPixels(n) >=  new_numPixels(n-1))
%         if(isDecrescent)
%             fprintf('Mudou p cre: %d(%d) , %d(%d)\n', new_numPixels(n),n, new_numPixels(n-1),n-1);
%             count2 = count2 + 1;
%             isDecrescent = false;
%             isCrescent = true;
%         end
%     end
%     if(new_numPixels(n) <  new_numPixels(n-1))
%         if(isCrescent)
%             fprintf('Mudou p dec: %d(%d) , %d(%d)\n', new_numPixels(n),n, new_numPixels(n-1),n-1);
%             count2 = count2 + 1;
%             isDecrescent = true;
%             isCrescent = false;
%         end
%     end
% end


figure(2); plot(new_binsLocation, new_numPixels);

%Agora é contar os locais dentro de um range
out = regions_count(new_numPixels,150);


out2 = percep_count(numPixels,4,mean_before);



teste = imread('teste.bmp');
% figure(3); imhist(teste);

