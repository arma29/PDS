function [out] = regions_count(array, threshold)
%REGIONS_COUNT Summary of this function goes here
%     Given a array,
%     Threshold, only intensifies above the threshold matters
%     Return the number of drastic changes between an element and his successor

out = 0;
for n=2:length(array)
    if(abs(array(n) - array(n-1)) > threshold)
        out = out + 1;
    end
end

end

