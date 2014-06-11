function [f, d, cpI] = getAllSIFT(image, StepColor, StepEdge, SizesColor, SizesEdge, hsize, sigma)
    cpI = edge_compass(image, 1);
    [f1, d1] = dsift(image, cpI, StepColor, SizesColor);
    [f2, d2] = edge_sift(cpI, StepEdge, SizesEdge);
    [d, f] = mergedesc(d1, d2, f1, f2);
    %   gbvs() meant to be used with images >= 128x128
    if ((size(image,1) >= 128) && (size(image,2) >= 128)) 
        map = gbvs_fast(image);
        cpI = map.master_map_resized;
    else
        cpI = gauss(cpI,hsize,sigma);
    end
    cpI = single(cpI);
end