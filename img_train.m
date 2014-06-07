function [ model ] = img_train( lv, im, options )
%IMG_TRAIN Summary of this function goes here
%   Detailed explanation goes here
%   lv: training label vector
%   im: training instance matrix
%   options: option string for LIBLINEAR
model = svm_train(lv,sparse(im),options);

end

