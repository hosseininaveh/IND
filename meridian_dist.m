function mdist = meridian_dist(a,flat,lat)
%
% mdist = meridian_dist(a,flat,lat) Function computes the meridian distance
% on an ellipsoid defined by semi-major axis (a) and denominator of
% flattening (flat) from the equator to a point having latitude (lat) in
% radians.
% e.g. mdist = (6378137, 298.257222101, -0.659895044028705) will compute
% the meridian distance for a point having latitude -37 deg 48 min
% 33.1234 sec on the GRS80 ellipsoid (a = 6378137, f = 1/298.257222101).
%--------------------------------------------------------------------------
% Function: meridian_dist()
%
% Usage: mdist = meridian_dist(a,flat,lat)
%
% Author: R.E.Deakin,
% School of Mathematical & Geospatial Sciences, RMIT University
% GPO Box 2476V, MELBOURNE, VIC 3001, AUSTRALIA.
% email: rod.deakin@rmit.edu.au
% Version 1.0 5 October 2009
%
% Purpose: Function computes the meridian distance
% on an ellipsoid defined by semi-major axis (a) and denominator of
% flattening (flat) from the equator to a point having latitude (lat) in
% radians.
%
% Functions required:
%
% Variables: a - semi-major axis of spheroid
% A,B,C... - coefficients
% e2 - eccentricity squared
% e4,e6,... - powers of e2
% f - f = 1/flat is the flattening of ellipsoid
% flat - denominator of flattening of ellipsoid
% mdist - meridian distance
%
% Remarks: The formulae used are given in Baeschlin, C.F., 1948,
% "Lehrbuch Der Geodasie", Orell Fussli Verlag, Zurich, pp.47-50.
% See also Deakin, R. E. and Hunter M. N., 2008, "Geometric
% Geodesy - Part A", Lecture Notes, School of Mathematical and
% geospatial Sciences, RMIT University, March 2008, pp. 60-65.
%
%--------------------------------------------------------------------------
% compute eccentricity squared
f = 1/flat;
e2 = f*(2-f);
% powers of eccentricity
e4 = e2*e2;
e6 = e4*e2;
e8 = e6*e2;
e10 = e8*e2;
% coefficients of series expansion for meridian distance
A = 1+(3/4)*e2+(45/64)*e4+(175/256)*e6+(11025/16384)*e8+(43659/65536)*e10;
B = (3/4)*e2+(15/16)*e4+(525/512)*e6+(2205/2048)*e8+(72765/65536)*e10;
C = (15/64)*e4+(105/256)*e6+(2205/4096)*e8+(10395/16384)*e10;
D = (35/512)*e6+(315/2048)*e8+(31185/131072)*e10;
E = (315/16384)*e8+(3465/65536)*e10;
F = (693/131072)*e10;
term1 = A*lat;
term2 = (B/2)*sin(2*lat);
term3 = (C/4)*sin(4*lat);
term4 = (D/6)*sin(6*lat);

term5 = (E/8)*sin(8*lat);
term6 = (F/10)*sin(10*lat);
mdist = a*(1-e2)*(term1-term2+term3-term4+term5-term6);
