function [f, d, cpI] = prepareImg (tsPath, tsName)
%   tsPath is the path of train set
%   for example: "D:\COURSE\ML\PRJ\MLKD-Final-Project-Release\ic-data\train"
    %pair = parsePair(tsPath, tsName);
    list = parseList(tsPath, tsName);
    
    %f = cell(size(pair,2),1);
    %d = cell(size(pair,2),1);
    %cpI = cell(size(pair,2),1);
    f = cell(size(list, 1), 1);
    d = cell(size(list, 1), 1);
    cpI = cell(size(list, 1), 1);

    tic;
    parfor i = 1:size(list, 1)%size(pair,2)
        filePath = [tsPath, '\', num2str(list(i, 1)), '.jpg'];%num2str(pair(1,i))
        fprintf('%d\n', i);
        [f{i}, d{i}, cpI{i}] = getAllSIFT(imread(filePath), 6, 5, 6, 5, 50, 10);
    end
    toc;

    parfor i = 1:size(f, 1);
        [f{i}, d{i}] = truncation(f{i}, d{i});
        d{i} = single(d{i}) / 255;
    end

    %save('fTrunc.mat', 'f', '-v7.3');
    %save('dTrunc.mat', 'd', '-v7.3');
    %save('cpI.mat', 'cpI', '-v7.3');

    %dTotal = cat(1, d{:});
    %fTotal = cat(1, f{:});

    %save('dTotal.mat', 'dTotal', '-v7.3');
    %save('fTotal.mat', 'fTotal', '-v7.3');

end