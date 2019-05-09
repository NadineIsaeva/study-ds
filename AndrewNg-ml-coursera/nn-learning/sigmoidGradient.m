function g = sigmoidGradient(z)
% Returns the gradient of the sigmoid function evaluated at z
% z can be matrox/vector

g = zeros(size(z));

a = sigmoid(z);

g = a.*(1-a);

end
