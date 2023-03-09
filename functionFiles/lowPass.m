% FILE: lowPass.m
% NOTE: This is a scripted function to do low pass filtering on a dataset.
% The filter can either be single or bidirectional.  The bidirectional
% cancels the lag induced by a single directional filter, and maintains
% temporal fidelity of the data.  All filtered data should be plotted
% against the raw data to ensure that the filtering passband is acceptable
% before the filtered data is used.
% KEY VARIABLES:    F_pass  [Hz] Cutoff frequency
%                   Fs      [Hz] Dataset sampling frequency
%                   data    [any] Dataset to filter
%                   type    [-] String that defines the filter type
%                   requested may be 'filt' for single direction or
%                   'filtfilt' for bidirectional filtering 
% AUTHOR: Alexander Yudell, Copyright TEAM Industries, 2021
% ASSOCIATED FILES: None
% VERSIONS: None


function [data_filt] = lowPass(F_pass,Fs,data,type)

[a,b] = size(data);

% Condition NaN Data
nanVec = find(isnan(data));
numVec = find(~isnan(data));
if exist('nanVec')
    for i = min(numVec + 1):length(data)
        if isnan(data(i))
            data(i) = data(i-1);        % Replace NaN data with value to the left
        end
    end
    data(1:min(numVec)) = data(min(numVec) + 1);
end


if a < b    % Flip data to column vector for filt filt
    data = data';
    flip = 1;
else
    flip = 0;
end

% LP FILTER
% Single Pole Lowpass Filter
f_c = F_pass;          % [Hz] Cutoff frequency
omega_c = f_c*2*pi;
a = (1/Fs)*omega_c;
b = [1 a-1];
data_1 = filter(a,b,data);

if Fs/F_pass <= 10
    warning('Sampling frequency should be at least 10x the passband frequency')
end

switch type
    case 'filt'
        data_filt = data_1;
        % % % Bi-directional filter
    case 'filtfilt'
        data_filt = flipud(data_1);
        offset = data_filt(1,1);
        data_filt = data_filt - offset;
        data_filt = filter(a,b,data_filt);
        data_filt = flipud(data_filt) + offset;
    otherwise
        error('Filter type must be either ''filt'' or ''filtfilt''')
end

if flip == 1
    data = data';       % Return data to previous format
end