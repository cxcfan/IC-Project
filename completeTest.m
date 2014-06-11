function [ ftVec ] = completeTest( tsPath, tsName, start, final, split )
%COMPLETETEST Summary of this function goes here
%   Detailed explanation goes here
tic;
codebook = zeros(1,1);
load('codebook2.mat');
codebook = codebook';
load('model_Hier_knn30_GVBS_5120.mat');

[f,d,cpI,list] = prepareImgFromBoundedList(tsPath,tsName,start,final);
ftVec = splitCode(d,f,cpI,codebook,split);

%   construct a set of fake labeled data
tlv = zeros(size(ftVec,1),2);
tlv(:,1) = list;
img_predict(tlv,ftVec,model);
fprintf('Test complete! Result is written in result.list.\n');
toc;
end

