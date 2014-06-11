function [ ftVec ] = codeV (cb, d, f, hm, knnLLC1, knnLLC2, lambda, knnW2P)
    %   d: cells of descriptors (one cell per image)
    %   f: cells of frames (position info needed)
    %   knnLLC1: default 5 -- for central
    %   knnLLC2: default 20 -- for side
    %   lambda: default 1e-4
    %   knnW2P: default 20
    sizeD = size(d,1);
    sizeR = size(cb,1);
    ftVec = zeros(sizeD, sizeR);
    %tic;
    %parfor
    parfor i = 1:sizeD
        %   coding one image
        %   codeI is a matrix of N * Ncb
        %   N is the number of descriptor
        %   Ncb is the size of codebook
        fprintf('working:%d\n',i);
        [codeII,codeI] = llc_approx(cb,d{i},knnLLC2,knnLLC1,lambda);
        %   visual words -> visual phrase
        f0 = f{i}(:,1:2);
        knnW = min(knnW2P,size(f0,1) - 1);
        [IDX,D] = knnsearch(f0,f0,'K',knnW+1);
        IDX = IDX(:,2:knnW+1);
        D = D(:,2:knnW+1);
        %   GPP Pooling
        codeR = zeros(1,sizeR);
        sizeI = size(f0,1);
        hm0 = hm{i};
        for j = 1:sizeI
            gaussCoeff = round(f0(j,:));
            diagSm = getSmooth(D(j,:),0.01);
            codeR = max(codeR,(max((diagSm * codeII(IDX(j,:),:)),[],1) + codeI(j,:)) * hm0(gaussCoeff(2),gaussCoeff(1)));
        end
        ftVec(i,:) = codeR;
    end
    %toc;
end