function [w,b] = remove_echo(x,alpha,D)
%REMOVE_ECHO Summary of this function goes here
%   Given a echoed signal x, parameters alpha and D
%   return the original signal w
%   this function uses filter

if(D >= length(x))
    error('Error. \nD must be lower than length of echoed signal');
end

%In this case, b will be used as denominator
b = [1, zeros(1,D), alpha];
w = filter(1,b,x);
end

