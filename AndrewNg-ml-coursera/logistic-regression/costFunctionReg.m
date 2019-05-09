function [J, grad] = costFunctionReg(theta, X, y, lambda)
% Compute cost and gradient for LR with regularization

% number of training examples
m = length(y);

J = 0;
grad = zeros(size(theta));

%hypothesis
h = sigmoid(X*theta);

% calculate penalty without the first theta value
theta1 = [0 ; theta(2:size(theta), :)];

regTerm = lambda*(theta1'*theta1)/(2*m);

J = J + ((-y)'*log(h) - (1-y)'*log(1-h))/m + regTerm;

grad = (X'*(h - y)+lambda*theta1)/m;

end
