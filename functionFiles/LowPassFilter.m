function [data_filt] = LowPassFilter(Fpass,Fs,data,type)

% This is a code snippet that creates an FIR lowpass filter in MATLAB and
% applies it to a data set in either a single direction or two directions.

% Fpass = 5000;             % Passband Frequency (Hz)
Fstop = min(Fpass*3,Fs/2);             % Stopband Frequency (Hz)
Apass = 3;              % Passband Ripple (dB)
Astop = 60;             % Stopband Attenuation (dB)
% Fs    = 1/10e-6;          % Sampling Frequency  (Hz)

d = designfilt('lowpassfir', ...
    'PassbandFrequency',Fpass/Fs,'StopbandFrequency',Fstop/Fs, ...
    'PassbandRipple',Apass,'StopbandAttenuation',Astop, ...
    'DesignMethod','kaiserwin');

% % Apply lowpass filter
if strcmp(type,'filt')
    data_filt = filter(d,data);
    
    % % Two Pass Lowpass filter
    % % % This filter runs the data through a lowpass filter once and then again
    % % % in the other direction.  This two-pass scheme eliminates time lags
    % % % associated with single pass lowpas filtering.
elseif strcmp(type,'filtfilt')
    data_filt = filtfilt(d,data);
end
