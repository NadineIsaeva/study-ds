function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
% Compute cost and gradient for regularized linear regression with multiple variables

m = length(y); 

J = 0;
grad = zeros(size(theta));

h = X*theta;
J = J + sum((h - y).^2);
J = J/(2*m);

regTerm = sum(theta(2:end).^2)*lambda/(2*m);

J = J + regTerm;

grad = (1/m)*(X'*(h-y));
theta(1) = 0;
regGrad = (lambda/m)*theta;

grad = grad + regGrad;

grad = grad(:);

end
