function loxodrome_inverse
%
% loxodrome_inverse: This function computes the inverse case for a
% loxodrome on the reference ellipsoid. That is, given the latitudes and
% longitudes of two points on the ellipsoid, compute the azimuth and the
% arc length of the loxodrome on the surface.
%--------------------------------------------------------------------------
% Function: loxodrome_inverse()
%
% Usage: loxodrome_inverse
%
% Author: R.E.Deakin,
% School of Mathematical & Geospatial Sciences, RMIT University
% GPO Box 2476V, MELBOURNE, VIC 3001, AUSTRALIA.
% email: rod.deakin@rmit.edu.au
% Version 1.0 5 October 2009
% Version 1.1 11 January 2010
%
% Purpose: This function computes the inverse case for a loxodrome on the
% reference ellipsoid. That is, given the latitudes and longitudes of
% two points on the ellipsoid, compute the azimuth and the arc length of
% the loxodrome on the surface.
%
% Functions required:
% [D,M,S] = DMS(DecDeg)
% isolat = isometric(flat,lat)
% mdist = meridian_dist(a,flat,lat)
%
% Variables:
% Az12 - azimuth of loxodrome P1-P2 (radians)
% a - semi-major axis of spheroid
% d2r - degree to radian conversion factor 57.29577951...
% disolat - difference in isometric latitudes (isolat2-isolat1)
% dlon - difference in longitudes (radian)
% dm - difference in meridian distances (dm = m2-m1)
% e - eccentricity of ellipsoid
% e2 - eccentricity of ellipsoid squared
% f - f = 1/flat is the flattening of ellipsoid
% flat - denominator of flattening of ellipsoid
% isolat1 - isometric latitude of P1 (radians)
% isolat2 - isometric latitude of P2 (radians)
% lat1 - latitude of P1 (radians)
% lat2 - latitude of P2 (radians)
% lon1 - longitude of P1 (radians)
% lon2 - longitude of P2 (radians)
% lox_s - distance along loxodrome
% m1,m2 - meridian distances of P1 and P2 (metres)
% pion2 - pi/2
%
% Remarks:
%
% References:
% [1] Deakin, R.E., 2010, 'The Loxodrome on an Ellipsoid', Lecture Notes,
% School of Mathematical and Geospatial Sciences, RMIT University,
% January 2010
% [2] Bowring, B.R., 1985, 'The geometry of the loxodrome on the
% ellipsoid', The Canadian Surveyor, Vol. 39, No. 3, Autumn 1985,
% pp.223-230.
% [3] Snyder, J.P., 1987, Map Projections-A Working Manual. U.S.
% Geological Survey Professional Paper 1395. Washington, DC: U.S.
% Government Printing Office, pp.15-16 and pp. 44-45.
% [4] Thomas, P.D., 1952, Conformal Projections in Geodesy and
% Cartography, Special Publication No. 251, Coast and Geodetic
% Survey, U.S. Department of Commerce, Washington, DC: U.S.
% Government Printing Office, p. 66.

%
%--------------------------------------------------------------------------
% Degree to radian conversion factor
d2r = 180/pi;
% Set ellipsoid parameters
a = 6378137; % GRS80
flat = 298.257222101;
% Set lat and long of P1 and P2 on ellipsoid
lat1 = -(36 + 47/60 + 49.2232/3600)/d2r; % Spring
lon1 = (148 + 11/60 + 48.3333/3600)/d2r;
lat2 = -(37 + 30/60 + 18.0674/3600)/d2r; % Wauka 1978
lon2 = (149 + 58/60 + 32.9932/3600)/d2r;
% Compute isometric latitude of P1 and P2
isolat1 = isometric(flat,lat1);
isolat2 = isometric(flat,lat2);
% Compute changes in isometric latitude and longitude between P1 and P2
disolat = isolat2-isolat1;
dlon = lon2-lon1;
% Compute azimuth
Az12 = atan2(dlon,disolat);
% Compute distance along loxodromic curve
m1 = meridian_dist(a,flat,lat1);
m2 = meridian_dist(a,flat,lat2);
dm = m2-m1;
lox_s = dm/cos(Az12);
%-----------------------
% Print result to screen
%-----------------------
fprintf('\n=======================');
fprintf('\nLoxodrome: Inverse Case');
fprintf('\n=======================');
fprintf('\nEllipsoid parameters');
fprintf('\na = %12.4f',a);
fprintf('\nf = 1/%13.9f',flat);
fprintf('\n\nTerminal points of curve');
% Print lat and lon of Point 1
[D,M,S] = DMS(lat1*d2r);
if D == 0 && lat1 < 0
fprintf('\nLatitude P1 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\nLatitude P1 = %4d %2d %9.6f (D M S)',D,M,S);
end
[D,M,S] = DMS(lon1*d2r);
if D == 0 && lon1 < 0
fprintf('\nLongitude P1 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\nLongitude P1 = %4d %2d %9.6f (D M S)',D,M,S);
end
% Print lat and lon of point 2
[D,M,S] = DMS(lat2*d2r);
if D == 0 && lat1 < 0
fprintf('\n\nLatitude P2 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\n\nLatitude P2 = %4d %2d %9.6f (D M S)',D,M,S);
end
[D,M,S] = DMS(lon2*d2r);
if D == 0 && lon2 < 0
fprintf('\nLongitude P2 = -0 %2d %9.6f (D M S)',M,S);
else

fprintf('\nLongitude P2 = %4d %2d %9.6f (D M S)',D,M,S);
end
% Print isometric latitudes of P1 and P2
[D,M,S] = DMS(isolat1*d2r);
if D == 0 && isolat1 < 0
fprintf('\n\nisometric lat P1 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\n\nisometric lat P1 = %4d %2d %9.6f (D M S)',D,M,S);
end
[D,M,S] = DMS(isolat2*d2r);
if D == 0 && isolat2 < 0
fprintf('\nisometric lat P2 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\nisometric lat P2 = %4d %2d %9.6f (D M S)',D,M,S);
end
% Print differences in isometric latitudes and longitudes
[D,M,S] = DMS(disolat*d2r);
if D == 0 && disolat < 0
fprintf('\n\ndiff isometric lat P2-P1 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\ndiff isometric lat P2-P1 = %4d %2d %9.6f (D M S)',D,M,S);
end
[D,M,S] = DMS(dlon*d2r);
if D == 0 && dlon < 0
fprintf('\ndiff in longitude P2-P1 = -0 %2d %9.6f (D M S)',M,S);
else
fprintf('\ndiff in longitude P2-P1 = %4d %2d %9.6f (D M S)',D,M,S);
end
% Print meridian distances of P1 and P2
fprintf('\n\nmeridian distance P1 = %15.6f',m1);
fprintf('\nmeridian distance P2 = %15.6f',m2);
fprintf('\n\ndiff in mdist P2-P1 = %15.6f',dm);
% Print azimuth of loxodrome
fprintf('\n\nAzimuth of loxodrome P1-P2');
[D,M,S] = DMS(Az12*d2r);
fprintf('\nAz12 = %3d %2d %9.6f (D M S)',D,M,S);
% Print loxodrome distance P1-P2
fprintf('\n\nloxodrome distance P1-P2');
fprintf('\ns = %15.6f',lox_s);
fprintf('\n\n');