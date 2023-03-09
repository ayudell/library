function [f, fftAmp] = fftStudy(data,Fs,plt)
% fftStudy.m function m-file
% AUTHORS:
% Alexander C Yudell
% University of Minnesota
% Department of Mechanical Engineering
%
% CREATION DATE:
% 9/14/2017
%
% PURPOSE:
% The objective of this function file is to generate a plot of an FFT Study
% for submitted data.  The input data is an array of column vectors, with
% each column vector representing an individual signal for analysis.  The
% final plot contains FFT analysis for each column vector, labeled as Col
% 1 - Col 'N'.
% 
% FUNCTION INPUTS:
% data: Array of column vectors representing individual signals for 
%       analysis.  May have 1 or more column vectors.
% Fs:   Data sampling rate (Hz)
% 
% NOTES:
% The frequency resolution of the FFT plot is dependent on the number of
% data points in each column vector.  Longer sample lengths or higher
% sampling rates will result in better frequency resolution.

N = size(data,1);		% Number of samples
M = size(data,2);		% Number of columns
if M > N
	error('Data must be in column format for FFT analysis using fftStudy')
end

M_vec = 1:M;            % Create vector for legend naming
% Take mean of data to zero, eliminates offset in FFT
data = data-mean(data);

NFFT = 2^nextpow2(N); % Next power of 2 from length of y
Y = fft(data,NFFT)/N; % data padded with trailing zeros to next power of two for improved performance

f = Fs/2*linspace(0,1,NFFT/2+1);		% Frequency Vector
fftAmp = 2*abs(Y(1:NFFT/2+1,:));		% FFT Study single sided amplitude

if plt ~= 0
	% Plot single-sided amplitude spectrum.
	figure
	grid on
	hold on
	plot(f,fftAmp)
	titlestr = sprintf('FFT Study\nSingle-Sided Amplitude Spectrum of y(t)');
	title(titlestr)
	legendCell = cellstr(num2str(M_vec', 'Col %2.0f'));
	legend(legendCell)
	xlabel('Frequency (Hz)')
	ylabel('|Y(f)|')
end

