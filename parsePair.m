function pair = parsePair(filePath, fileName)
   fid = fopen([filePath,'\',fileName], 'r');
   pair = fscanf(fid, '%d', [2, inf]);
   fclose(fid);
end