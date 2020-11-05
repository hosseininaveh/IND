function isolat = isometric(flat,lat)
%
% isolat=isometric(flat,lat) Function computes the isometric latitude
% (isolat) of a point whose latitude (lat) is given on an ellipsoid whose
% denominator of flattening is flat.
% Latitude (lat) must be in radians and the returned value of isometric
% latitude (isolat) will also be in radians.
% Example: isolat = isometric(298.257222101,-0.659895044028705);
% should return isolat = -0.709660227088983 radians,
% equal to -40 39 37.9292417795658 (DMS) for latitude equal to
% -0.659895044028705 radians (-37 48 33.1234 (DMS)) on the GRS80
% ellipsoid.
%--------------------------------------------------------------------------
% Function: isometric(flat,lat)
%
% Syntax: isolat = isometric(flat,lat);
%
% Author: R.E.Deakin,
% School of Mathematical & Geospatial Sciences, RMIT University
% GPO Box 2476V, MELBOURNE, VIC 3001, AUSTRALIA.
% email: rod.deakin@rmit.edu.au
% Version 1.0 5 October 2009
%
% Purpose: Function computes the isometric latitude of a point whose
% latitude is given on an ellipsoid defined by semi-major axis (a) and
% denominator of flattening (flat).
%
% Return value: Function isometric() returns isolat (isometric latitude in
% radians)
%
% Variables:
% e - eccentricity of ellipsoid
% e2 - eccentricity-squared
% f - flattening of ellipsoid
% flat - denominator of flattening
%
% Remarks:
% Isometric latitude is an auxiliary latitude proportional to the spacing
% of parallels of latitude on an ellipsoidal Mercator projection.
%
% References:
% [1] Snyder, J.P., 1987, Map Projections-A Working Manual. U.S.
% Geological SurveyProfessional Paper 1395. Washington, DC: U.S.
% Government Printing Office, pp.15-16.
%
%
%--------------------------------------------------------------------------
% compute flattening f eccentricity squared e2
f = 1/flat;
e2 = f*(2-f);
e = sqrt(e2);
x = e*sin(lat);
y = (1-x)/(1+x);
z = pi/4 + lat/2;
% calculate the isometric latitude
isolat = log(tan(z)*(y^(e/2)));