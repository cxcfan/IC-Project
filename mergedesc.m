function [ DESCR, FRAME ] = mergedesc( DESCR1, DESCR2, FRAME1, FRAME2 )
%MERGEDESC Summary of this function goes here
%   Detailed explanation goes here
DESCR = [ DESCR1; DESCR2 ];
FRAME = [ FRAME1; FRAME2 ];
end