% This function inputs a start and stop time, and outputs an array of the
% indecies of the vector contained by those start and end times

function tVec = tIndex(t_start,t_end,t)

t1 = round(interp1(t,1:numel(t),t_start));
t2 = round(interp1(t,1:numel(t),t_end));

tVec = t1:t2;