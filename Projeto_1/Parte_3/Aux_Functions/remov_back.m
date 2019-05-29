function [currFrame] = remov_back(singleFrame,nextFrame, threshold)
%REMOV_BACK Summary of this function goes here
%   Detailed explanation goes here
%   Given singleFrame and nextFrame and threshold
%   Return the background
%   Subtraction Background based
%   |Image(x,y,index) - Image(x,y,index-1)| > threshold -> para mostrar no
%   video
%   Do contrário, não mostra nada

%Pre process -> mais eficiência
currFrame = zeros([size(singleFrame,1) size(singleFrame,2)] , class(singleFrame));
for i = 1:size(singleFrame,1)
    for j = 1:size(singleFrame,2)
        %Matriz RGB
        for k = 1:3
            if(abs(singleFrame(i,j,k) - nextFrame(i,j,k)) > threshold)
                currFrame(i,j,k) = singleFrame(i,j,k) - nextFrame(i,j,k);
            else
                currFrame(i,j,k) = 0;
            end
        end
        
    end
end 

end

