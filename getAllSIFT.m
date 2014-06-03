function [f, d] = getAllSIFT(image, StepColor, StepEdge, SizesColor, SizesEdge)
    eI = edge_compass(image, 1);    
    [f1, d1] = dsift(image, eI, StepColor, SizesColor);
    [f2, d2] = edge_sift(eI, StepEdge, SizesEdge);
    [d, f] = mergedesc(d1, d2, f1, f2);
end