function list = parseList( filePath, fileName )
%PARSELIST Summary of this function goes here
%   Detailed explanation goes here
fid = fopen([filePath,'\',fileName], 'r');
list = fscanf(fid,'%d',[1,inf]);
list = list';
fclose(fid);
end

