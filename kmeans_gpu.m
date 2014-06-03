function [Centroids Indx SizeofClusters gpu_Time] = kmeans_gpu(dataset, numClusters)
%K-means Clustering using the gpu
% C = kmeans_gpu(X, K) partitions the points in the N-by-P data matrix
% X into K clusters. Rows of X correspond to points, columns correspond to
% variables. The algorithm is executed exclusively on the systems GPU. kmeans_gpu returns
% a K-by-P matrix containing the cluster centers. kmeans_gpu uses squared
% Euclidean distances.
%
% [C, IDX] = kmeans_gpu(X, K) returns the cluster indices of each point in a N-by-1 matrix.
%
% [C, IDX, S] = kmeans_gpu(X, K) returns the size of each cluster in a K-by-1 matrix.
%
% [C, IDX, S, T] = kmeans_gpu(X, K) returns the execution time measured by cuda events.
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr


    Objects  = size(dataset,1);
    numberToAdd = mod(Objects, 128);
    if numberToAdd ~= 0
        numberToAdd = 128 - numberToAdd;
    end
    dummy = [];
    if numberToAdd > 0
        dummy = randi([1 Objects], 1, numberToAdd);
    end
    if ~isempty(dummy)
        dataset = [dataset; dataset(dummy,:)];
    end
    
    [Centroids Indx SizeofClusters gpu_Time] = cudaKmeans(single(dataset), single(dataset'), numClusters);
    
    
    Centroids = Centroids';
    Indx = Indx(1:Objects) + 1;

end