function centroids = computeCentroids(X, idx, K)
% Returns new centroids by computing the means of the data points assigned to each centroid

[~, n] = size(X);

centroids = zeros(K, n);

for ind_k = 1:K
    sel = (idx == ind_k);
    centroids(ind_k,:) = mean(X(sel,:));
end

%vectorized
%dist = idx == (1:K);
%cen = bsxfun(@rdivide, (dist' * X), sum(dist)')

end