function [ dC,fC,cpIC ] = splitCell( d,f,cpI,n )
%SPLITCELL Summary of this function goes here
%   Detailed explanation goes here
%   d: descriptor cell
%   f: frame cell
%   cpI: heat map cell
%   n: how many splits?
dC = cell(n,1);
fC = cell(n,1);
cpIC = cell(n,1);

sizeD = size(d,1);
sizeA = floor(sizeD / n);
counter = 0;
for i = 1:(n-1)
    dSC = cell(sizeA,1);
    fSC = cell(sizeA,1);
    cpISC = cell(sizeA,1);
    for j = 1:sizeA
        dSC{j} = d{counter + j};
        fSC{j} = f{counter + j};
        cpISC{j} = cpI{counter + j};
    end
    counter = counter + sizeA;
    dC{i} = dSC;
    fC{i} = fSC;
    cpIC{i} = cpISC;
    %   save to file
    fprintf('saving %d\n',i);
    save(['dC',num2str(i),'.mat'],'dSC','-v7.3');
    save(['fC',num2str(i),'.mat'],'fSC','-v7.3');
    save(['cpIC',num2str(i),'.mat'],'cpISC','-v7.3');
end

remain = sizeD - counter;
dSC = cell(remain,1);
fSC = cell(remain,1);
cpISC = cell(remain,1);
for j = 1:remain
    dSC{j} = d{counter + j};
    fSC{j} = f{counter + j};
    cpISC{j} = cpI{counter + j};
end
dC{n} = dSC;
fC{n} = fSC;
cpIC{n} = cpISC;
%   save to file
fprintf('saving %d\n',n);
save(['dC',num2str(n),'.mat'],'dSC','-v7.3');
save(['fC',num2str(n),'.mat'],'fSC','-v7.3');
save(['cpIC',num2str(n),'.mat'],'cpISC','-v7.3');
end

