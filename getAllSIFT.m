function [f, d] = getAllSIFT(image, StepColor, StepEdge)
    eI = edge_compass(image, 1);    
    [f1, d1] = dsift(image, eI, StepColor);
    [f2, d2] = edge_sift(eI, StepEdge);
    [d, f] = mergedesc(d1, d2, f1, f2);
end