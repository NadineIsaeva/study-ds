function J = computeCostMulti(X, y, theta)
% Compute cost for linear regression with multiple variables using theta as the
%   parameter for linear regression to fit the data points in X and y

% number of training examples
m = length(y);
 
J = 0;

% vectorized form for the multivariate case
J = J + 1/(2*m) * (X*theta - y)' * (X*theta - y);

end