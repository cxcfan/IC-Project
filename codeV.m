function [ ftVec ] = codeV (cb, d, f, hm, knnLLC1, knnLLC2, lambda, knnW2P)
    %   d: cells of descriptors (one cell per image)
    %   f: cells of frames (position info needed)
    %   knnLLC1: default 5 -- for central
    %   knnLLC2: default 20 -- for side
    %   lambda: default 1e-4
    %   knnW2P: default 16 (minimal number of descr: 18)
    sizeD = size(d,1);
    sizeR = size(cb,1);
    ftVec = zeros(sizeD, sizeR);
    tic;
    parfor i = 1:sizeD
        %   coding one image
        %   codeI is a matrix of N * Ncb
        %   N is the number of descriptor
        %   Ncb is the size of codebook
        fprintf('working:%d\n',i);
        codeI = llc_approx(cb,d{i},knnLLC1,lambda);
        codeII = llc_approx(cb,d{i},knnLLC2,lambda);
        %   visual words -> visual phrase
        f0 = f{i}(:,1:2);
        IDX = knnsearch(f0,f0,'K',knnW2P+1);
        IDX = IDX(:,2:knnW2P+1);
        %   GPP Pooling
        codeR = zeros(1,sizeR);
        sizeI = size(f0,1);
        hm0 = hm{i};
        for j = 1:sizeI
            gaussCoeff = round(f0(j,:));
            codeR = max(codeR,max((codeII(IDX(j,:),:) * hm0(gaussCoeff(2),gaussCoeff(1))),[],1) + codeI(j,:));
        end
        ftVec(i,:) = codeR;
    end
    toc;
end