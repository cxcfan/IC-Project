function [dTotal, fTotal, cpI] = train (tsPath)
%   tsPath is the path of train set
%   for example: "D:\COURSE\ML\PRJ\MLKD-Final-Project-Release\ic-data\train"
    pair = parseTrainSet(tsPath);

    f = cell(size(pair, 2), 1);
    d = cell(size(pair, 2), 1);

    tic;
    parfor i = 1:size(pair, 2)
        filePath = [tsPath, '\', num2str(pair(1, i)), '.jpg'];
        fprintf('%d\r\n', i);
        [f{i}, d{i}, cpI{i}] = getAllSIFT(imread(filePath), 8, 7, 7, 6);
    end
    toc;

    parfor i = 1:size(f, 1);
        [f{i}, d{i}] = truncation(f{i}, d{i});
    end

    save('f_trunc.mat', 'f', '-v7.3');
    save('d_trunc.mat', 'd', '-v7.3');

    dTotal = cat(1, d{:});
    fTotal = cat(1, f{:});

    save('dTotal.mat', 'dTotal', '-v7.3');
    save('fTotal.mat', 'fTotal', '-v7.3');

end