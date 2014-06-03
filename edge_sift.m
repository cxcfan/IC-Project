function [ FRAMES, DESCRS ] = edge_sift( S, step, sizes )
%EDGE_SIFT Summary of this function goes here
%   Detailed explanation goes here
S0 = single(S);
[FRAMES, DESCRS] = vl_phow(S0,'Color','gray','Step',step,'Sizes',sizes);
FRAMES = FRAMES';
DESCRS = DESCRS';
end