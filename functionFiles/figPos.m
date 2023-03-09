% figPos.m
%
% AUTHORS:
% Alexander Yudell
% TEAM Industries R&D Department
% Copyright TEAM Industries, 2021
%
% CREATION DATE:
% 8/25/2021
%
% PURPOSE:
% The objective of this script is to reposition a figure quickly and easily
% based on a monitor number, a figure position and a scaling factor
% 
% KEY VARIABLES:
% n:            [-] Monitor number (assumes 1920x1080)
% m:            [-] Figure position (1<m<6)
% sf:           [-] Scaling factor

function figPos(n,m,sf)

a = 560*sf;
b = 420*sf;

pos{1,1} = [-1715 560 a b];
pos{1,2} = [-1145 560 a b];
pos{1,3} = [-575 560 a b];
pos{1,4} = [-1715 50 a b];
pos{1,5} = [-1145 50 a b];
pos{1,6} = [-575 50 a b];

pos{2,1} = [210 560 a b];
pos{2,2} = [780 560 a b];
pos{2,3} = [1350 560 a b];
pos{2,4} = [210 50 a b];
pos{2,5} = [780 50 a b];
pos{2,6} = [1350 50 a b];

set(gcf,'position',pos{n,m})