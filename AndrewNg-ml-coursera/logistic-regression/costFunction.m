function [J, grad] = costFunction(theta, X, y)
% Compute cost and gradient for logistic regression 

% number of training examples
m = length(y);
 
J = 0;
grad = zeros(size(theta));

%cost of a particular choice of theta
J = J + (-y'*log(sigmoid(X*theta)) - (1-y)'*log(1 - sigmoid(X*theta)))/m;

%vector of partial derivatives of the cost w.r.t. each parameter in theta
grad = (X'*(sigmoid(X*theta) - y))/m;

end
