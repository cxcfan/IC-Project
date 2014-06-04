function [f, d, cpI] = getAllSIFT(image, StepColor, StepEdge, SizesColor, SizesEdge)
    cpI = edge_compass(image, 1);    
    [f1, d1] = dsift(image, cpI, StepColor, SizesColor);
    [f2, d2] = edge_sift(cpI, StepEdge, SizesEdge);
    [d, f] = mergedesc(d1, d2, f1, f2);
end