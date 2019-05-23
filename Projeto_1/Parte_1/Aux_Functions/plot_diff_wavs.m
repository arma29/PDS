function plot_diff_wavs(x,vec_a,D, count)
%PLOT_DIFF_WAVS Summary of this function goes here
%   Given a echoed signal x, vector of alphas, D
%   plus count as auxiliar
%   Plot the signals for differnts alphas
w = remove_echo(x,vec_a(1),D);
w2 = remove_echo(x,vec_a(2),D);
w3 = remove_echo(x,vec_a(3),D);

figure(count);
subplot(3,1,1); plot(w); grid on; title(['F Echoed Signal for alpha = ' num2str(vec_a(1))])
subplot(3,1,2); plot(w2); grid on; title(['F Echoed Signal for alpha = ' num2str(vec_a(2))])
subplot(3,1,3); plot(w3); grid on; title(['F Echoed Signal for alpha = ' num2str(vec_a(3))])
suptitle('Plots of signals for differents alpha');

end

