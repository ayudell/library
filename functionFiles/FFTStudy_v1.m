
function FFTStudy(data,Fs)
% This code produces an FFT plot of a dataset.
% Variables:
% data:     Data set to be analyzed (1D array)
% Fs:       Sampling frequency (Hz)

L = length(data);

% Take mean of data to zero

data = data-mean(data);

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(data,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
figure
grid on
hold on
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')