function [ FRAMES, DESCRS ] = dsift( I, S, step, sizes )
%DSIFT Summary of this function goes here
%   Detailed explanation goes here
%   I must be a grayscale image
I0 = single(I);
[FRAMES,DESCRS] = vl_phow(I0,'Color','gray','Step',step,'Sizes',sizes);
FRAMES = FRAMES';
DESCRS = DESCRS';
newX = size(S,2);
newY = size(S,1);
oldX = size(I,2);
oldY = size(I,1);
coeffX = newX / oldX;
coeffY = newY / oldY;
FRAMES(:,1) = FRAMES(:,1) * coeffX;
FRAMES(:,2) = FRAMES(:,2) * coeffY;
end