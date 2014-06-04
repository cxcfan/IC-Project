function [ CMat ] = llc_approx( CB, Des, knn, lambda )
%LLC_APPROX Summary of this function goes here
%   Detailed explanation goes here
%   CB:     M x d codebook, M entries in a d-dim space
%   Des:    N x d codebook, N descriptors in a d-dim space
if knn <= 0
    knn = 5;
end

Des = single(Des);
nDES = size(Des,1);
nCB = size(CB,1);

IDX = knnsearch(CB,Des,'K',knn);

R = eye(knn,knn);
CMat = zeros(nDES, nCB);
for i = 1:nDES
    idx = IDX(i,:);
    B = CB(idx,:) - repmat(Des(i,:),knn,1);
    C = B * B';
    C = C + R * trace(C) * lambda;
    tC = C \ ones(knn,1);
    tC = tC / sum(tC);
    CMat(i,idx) = tC';
end

end

