function [count] = percep_count(array,division,threshhold)
%PERCEP_COUNT Summary of this function goes here
%     Given a array
%     A division represents the length of division of array (must be power of 2)
%     Threshold, only intensifies above the threshold matters
%     return the parts of array that satisfy the specification
if(mod(length(array),division) ~= 0)
    error('Error. \nDivision must agree with length of array');
end

count = 0;
for n=1:division:length(array)
    count = count + percep_count_aux(array(n:n+division-1),threshhold);
end    

end

