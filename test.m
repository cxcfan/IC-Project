tsPath = 'D:\COURSE\ML\PRJ\MLKD-Final-Project-Release\ic-data\train';

pair = parseTrainSet(tsPath);

f = cell(size(pair, 2), 1);
d = cell(size(pair, 2), 1);

tic;
parfor i = 1001:size(pair, 2)
    filePath = [tsPath, '\', num2str(pair(1, i)), '.jpg'];
    fprintf('%d\r\n', i);
    [f{i}, d{i}] = getAllSIFT(imread(filePath), 6, 7);
end
toc;

