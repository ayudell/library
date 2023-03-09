%  resamp.m
%
% AUTHORS:
% Alexander Yudell
% TEAM Industries R&D Department
% Copyright TEAM Industries, 2021
%
% CREATION DATE:
% 6/01/2021
%
% PURPOSE:
% The objective of this script is to input a data vector and resample that
% data vector to a new time vector.  Resampling occurs via linear
% interpolation.  Data may be upsampled or downsampled
% 
% KEY VARIABLES:
% datain       [(any)] Vector of data values that correspond to the time vector tin
% tin           [s] Time vector of datain
% tout          [s] Time vector that datain should be resampled to
% dataout       [(any)] Resampled data

function [dataout] = resamp(datain,tin,tout)

tsin = timeseries(datain,tin);
tsout = resample(tsin,tout);
dataout = tsout.data;