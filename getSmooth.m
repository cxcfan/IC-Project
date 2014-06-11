function [ diagSm ] = getSmooth( dist,sigma )
%GETSMOOTH Summary of this function goes here
%   Detailed explanation goes here
%   dist: Distance list
%   sigma: Smooth coefficient
dist = -sigma * dist;
diagEle = exp(dist);
diagSm = diag(diagEle);

end

