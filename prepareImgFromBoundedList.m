function [ f, d, cpI, list ] = prepareImgFromBoundedList( tsPath, tsName, start, final )
%PREPAREIMGFROMBOUNDEDLIST Summary of this function goes here
%   Detailed explanation goes here
    list = parseList(tsPath, tsName);
    
    if start <= 0
        start = 1;
    end
    if final > size(list,1);
        final = size(list,1);
    end
    sizeS = final - start + 1;
    f = cell(sizeS, 1);
    d = cell(sizeS, 1);
    cpI = cell(sizeS, 1);

    %tic;
    parfor i = start:final
        filePath = [tsPath, '\', num2str(list(i, 1)), '.jpg'];
        fprintf('working: %d\n', i);
        [f{i}, d{i}, cpI{i}] = getAllSIFT(imread(filePath), 7, 9, 6, 7, 50, 10);
    end
    
    parfor i = 1:size(f, 1);
        [f{i}, d{i}] = truncation(f{i}, d{i});
        d{i} = single(d{i}) / 255;
    end
    %toc;

end

