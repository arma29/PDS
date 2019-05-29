function [new_video] = video_back(vobj, numFrames,threshold)
%VIDEO_BACK Summary of this function goes here
%   Apply the algorithm to all frames and compress to new video

%   Pre process -> mais eficiência
I = read(vobj,1);
new_video = zeros([size(I,1) size(I,2) 3 numFrames], class(I));

for k = 1: numFrames-1
    singleFrame = read(vobj,k+1);

    nextFrame = read(vobj,k);

    currFrame = remov_back(singleFrame,nextFrame, threshold);
    
    new_video(:,:,:,k) = currFrame;
end 
new_video(:,:,:,1) = new_video(:,:,:,2);
end

