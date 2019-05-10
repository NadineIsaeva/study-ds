function idx = findClosestCentroids(X, centroids)
% Returns the closest centroids in idx for all samples in X 
% idx = m x 1 vector of centroid assignments (each entry in range [1..K])

% Set K
K = size(centroids, 1);

idx = zeros(size(X,1), 1);

for ind_ex = 1:size(idx, 1)
    J = zeros(K, 1);
    for ind_k = 1:K
        J(ind_k) = 1/size(idx, 1)*sum(((X(ind_ex, :)' - centroids(ind_k, :)')).^2);
    end
    [~, minInd] = min(J);
    idx(ind_ex) = idx(ind_ex) + minInd;
end

end