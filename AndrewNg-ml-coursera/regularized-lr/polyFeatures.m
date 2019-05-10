function [X_poly] = polyFeatures(X, p)
% Takes data matrix X (size m x 1) and returns m*p matrix
% with features in up to p dimensions

% used for adding more features to fight underfitting

X_poly = zeros(numel(X), p);

for i = 1:p
    X_poly(:, i) = X.^i;
end

end
