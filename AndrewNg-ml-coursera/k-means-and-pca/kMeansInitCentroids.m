function centroids = kMeansInitCentroids(X, K)
% Initialize K centroids to be used in K-Means on dataset X

centroids = zeros(K, size(X, 2));

%Randomly reorder the indicies of examples
randidx = randperm(size(X,1));

% Take the first K examples
centroids = X(randidx(1:K),:);

end