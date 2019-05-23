function plot_wavs(y,alpha,D,count)
%PLOT_WAVS Summary of this function goes here
%   Given a original signal y, echoed signal x and filtered signal w
%   plus parameters alpha and D
%   plus count for multiple figures
%   Plot the 3 plots of signal for same alpha.

x = add_echo(y,alpha,D);
w = remove_echo(x,alpha,D);

figure(count);
subplot(3,1,1); plot(y); grid on; title('Original Signal')
subplot(3,1,2); plot(x); grid on; title('Echoed Signal')
subplot(3,1,3); plot(w); grid on; title('F Echoed Signal')
suptitle(['Plots of signals for alpha = ' num2str(alpha) ' and D = ' num2str(D)]);
end

