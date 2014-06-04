function [ GS ] = gauss ( S, hsize, sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   S should be a processed image after compass filter
%   recommanded value of hsize is 50
%   recommanded value of sigma is 0.4?
    f = fspecial('gaussian', [hsize,hsize], sigma);
    GS = imfilter(S,f);
end