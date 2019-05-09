function g = sigmoid(z)
% sigmoid function, works with vectors and matrices

g = zeros(size(z));

g = 1./(1 + exp(-z));

end
