function pair = parseTrainSet(filePath)
   fid = fopen([filePath, '\train.label'], 'r');
   pair = fscanf(fid, '%d', [2, inf]);
end