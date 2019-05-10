function Z = projectData(X, U, K)
% computes projection of input data X into the reduced dimensional space
% using only the top K eigenvectors in U

Z = zeros(size(X, 1), K);

Z = X*U(:, 1:K);

end
