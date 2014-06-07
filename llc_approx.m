function [ CMat, CMat2 ] = llc_approx( CB, Des, knnL, knnS, lambda )
%LLC_APPROX Summary of this function goes here
%   Detailed explanation goes here
%   CB:     M x d codebook, M entries in a d-dim space
%   Des:    N x d codebook, N descriptors in a d-dim space
if knnL <= 0
    knnL = 5;
end

Des = single(Des);
nDES = size(Des,1);
nCB = size(CB,1);

IDX = knnsearch(CB,Des,'K',knnL);
IDX2 = IDX(:,1:knnS);

R = eye(knnL,knnL);
R2 = eye(knnS,knnS);
CMat = zeros(nDES, nCB);
CMat2 = zeros(nDES, nCB);
for i = 1:nDES
    idx = IDX(i,:);
    idx2 = IDX2(i,:);
    B = CB(idx,:) - repmat(Des(i,:),knnL,1);
    C = B * B';
    C2 = C(1:knnS,1:knnS);
    C = C + R * trace(C) * lambda;
    C2 = C2 + R2 * trace(C2) * lambda;
    %   CMat
    tC = C \ ones(knnL,1);
    tC = tC / sum(tC);
    CMat(i,idx) = tC';
    %   CMat2
    tC2 = C2 \ ones(knnS,1);
    tC2 = tC2 / sum(tC2);
    CMat2(i,idx2) = tC2';
end

end

