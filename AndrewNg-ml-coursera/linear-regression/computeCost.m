function J = computeCost(X, y, theta)
% Compute cost for linear regression using theta as the
%   parameter for linear regression to fit the data points in X and y

% number of training examples
m = length(y);

% hypothesis
h = X*theta;

%cost
J = sum((h - y).^2)/(2 * m);

end
