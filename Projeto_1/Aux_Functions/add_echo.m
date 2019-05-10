function [x] = add_echo(y,alpha,D)
%ADD_ECHO Summary of this function goes here
%   Given a signal y , parameters alpha and D (D must be < length y)
%   return the y signal with echo
%   This function uses filter

if(D >= length(y))
    error('Error. \nD must be lower than length of original signal');
end

%In this case, b will be used as numerator
b = [1, zeros(1,D), alpha]
x = filter(b,1,y);
end

