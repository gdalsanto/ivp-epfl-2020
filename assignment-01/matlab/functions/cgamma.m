function newmap=cgamma(map,g)
% CGAMMA gamma Correction
% CGAMMA Apply the gamma correction factor
%
% NEWMAP = CGAMMA(MAP,G) apply the gamma correction factor G
% to the colormap MAP and return the result in NEWMAP
%
% NEWRGB = CGAMMA(RGB,G) apply the gamma correction factor G
%to the TrueColor image RGB and return the result in NEWRGB
%
% NEWI = CGAMMA(I,G) apply the gamma correction factor G
% to intensities I and return the result in NEWI
%
% Gamma correction of the color table for gamma = g
newmap=map.^g;