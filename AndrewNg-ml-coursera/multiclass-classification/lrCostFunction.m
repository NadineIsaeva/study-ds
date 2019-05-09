function [J, grad] = lrCostFunction(theta, X, y, lambda)
% Compute cost and gradient for LR with regularization

m = length(y);

J = 0;
grad = zeros(size(theta));

h = sigmoid(X*theta);

newTheta = theta;
newTheta(1) = 0;

regTerm = (lambda/(2*m))*(newTheta')*newTheta;

J = J + 1/m*(-y'*log(h) - (1-y)'*log(1-h)) + regTerm;

grad = grad + 1/m*X'*(h - y) + lambda/m*newTheta;

grad = grad(:);

end
