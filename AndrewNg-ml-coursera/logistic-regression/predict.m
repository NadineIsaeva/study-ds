function p = predict(theta, X)
% Returns vector of 0's and 1's using learned parameters theta
% Predicts these labels with a threshold 0.5

% Number of training examples
m = size(X, 1);

p = zeros(m, 1);

p = (sigmoid(X*theta)>0.5);

end
