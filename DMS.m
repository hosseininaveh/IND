function [D,M,S] = DMS(DecDeg)
% [D,M,S] = DMS(DecDeg) This function takes an angle in decimal degrees and returns
% Degrees, Minutes and Seconds
val = abs(DecDeg);
D = fix(val);
M = fix((val-D)*60);
S = (val-D-M/60)*3600;
if(DecDeg<0)
D = -D;
end
return