function [f, d, cpI] = prepareImgFromPair (tsPath, tsName)
%   tsPath is the path of train set
%   for example: "D:\COURSE\ML\PRJ\MLKD-Final-Project-Release\ic-data\train"
    pair = parsePair(tsPath, tsName);
    
    f = cell(size(pair,2),1);
    d = cell(size(pair,2),1);
    cpI = cell(size(pair,2),1);
    
    tic;
    parfor i = 1:size(pair,2)
        filePath = [tsPath, '\', num2str(pair(1,i)), '.jpg'];
        fprintf('working: %d\n', i);
        [f{i}, d{i}, cpI{i}] = getAllSIFT(imread(filePath), 7, 9, 6, 7, 50, 10);
    end
    
    parfor i = 1:size(f, 1);
        [f{i}, d{i}] = truncation(f{i}, d{i});
        d{i} = single(d{i}) / 255;
    end
    toc;
    
    %save('fTrunc.mat', 'f', '-v7.3');
    %save('dTrunc.mat', 'd', '-v7.3');
    %save('cpI.mat', 'cpI', '-v7.3');

    %dTotal = cat(1, d{:});
    %fTotal = cat(1, f{:});

    %save('dTotal.mat', 'dTotal', '-v7.3');
    %save('fTotal.mat', 'fTotal', '-v7.3');

end