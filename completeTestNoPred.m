function [ ftVec ] = completeTestNoPred( tsPath, tsName, start, final, split )
%COMPLETETESTNOPRED Summary of this function goes here
%   Detailed explanation goes here
tic;
codebook = zeros(1,1);
load('codebook2.mat');
codebook = codebook';
load('model_Hier_knn30_GVBS_5120.mat');

[f,d,cpI] = prepareImgFromBoundedList(tsPath,tsName,start,final);
ftVec = splitCode(d,f,cpI,codebook,split);
toc;

end

