function [U, S] = pca(X)
% computes eigenvectors of the covariance matrix of X
% Returns the eigenvectors U, the eigenvalues (on diagonal) in S

[m, n] = size(X);

U = zeros(n);
S = zeros(n);

% compute covariance matrix
sigma = 1/m*(X'*X);

%compute eigenvectors and eigenvalues of covariance matrix
[U, S, V] = svd(sigma);

end