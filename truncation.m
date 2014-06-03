function [ NewFRAMES, NewDESCRS ] = truncation( FRAMES, DESCRS )
%TRUNCATE Summary of this function goes here
%   Detailed explanation goes here
C = max(DESCRS,[],2);
idx = find(C == 0);
NewFRAMES = FRAMES;
NewFRAMES(idx,:) = [];
NewDESCRS = DESCRS;
NewDESCRS(idx,:) = [];
end

