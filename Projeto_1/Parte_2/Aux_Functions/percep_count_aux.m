function [count] = percep_count_aux(subArray,threshold)
%PERCEP_COUNT_AUX Summary of this function goes here
%   Detailed explanation goes here
count = 0;
for n=1:length(subArray)
    if(subArray(n) >= threshold)
        count = 1;
        return
    end
end

end

