function [ pl ] = img_predict( pair, tim, model )
%IMG_PREDICT Summary of this function goes here
%   Detailed explanation goes here
%   pair: file name list + test label vector
%   tim: test instance matrix
%   model: train model
%   pl: predict label
tlv = pair(:,2);
pl = svm_predict(tlv,sparse(tim),model);
pair(:,2) = pl;

fid = fopen('result.list','w');
fprintf(fid,'%d %d\n',pair');
fclose(fid);
end

