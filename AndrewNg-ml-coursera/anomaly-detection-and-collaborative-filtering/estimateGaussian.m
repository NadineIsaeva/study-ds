function [mu, sigma2] = estimateGaussian(X)
% Estimate mean and variance of Gaussian distribution for all features in X

[m, n] = size(X);

mu = zeros(n, 1);
sigma2 = zeros(n, 1);

mu = mean(X);
sigma2 = (sum((bsxfun(@minus, X, mu)).^2))/m;

end
