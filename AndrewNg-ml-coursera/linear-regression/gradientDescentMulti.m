function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
% Performs gradient descent to learn theta: updates theta by
%   taking num_iters gradient steps with learning rate alpha

%number of training examples
m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    
    % hypothesis
    h = X*theta;

    %parameter update
    theta = theta - alpha * (1/m) * X' * (h - y);

    % Save the cost J in every iteration
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
