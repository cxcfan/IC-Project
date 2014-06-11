function [ ftVec ] = splitCode ( d,f,cpI,codebook,split )
%   d,f,cpI: descriptors, frames, heat maps
%   split: how many splits?
%tic;
%   split the data
splitCell(d,f,cpI,split);
%   clear big data
clear cpI;
clear d;
clear f;
%   construct ftVec cell
ftVec = cell(split,1);
%   load splitted data
for i = 1:split
    load(['cpIC',num2str(i),'.mat']);
    load(['dC',num2str(i),'.mat']);
    load(['fC',num2str(i),'.mat']);
    ftVec{i} = codeV(codebook,dSC,fSC,cpISC,5,30,1e-4,20);
    clear dSC;
    clear fSC;
    clear cpISC;
end

ftVec = cat(1,ftVec{:});
%toc;
end