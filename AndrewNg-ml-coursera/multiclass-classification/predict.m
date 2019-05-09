function p = predict(Theta1, Theta2, X)
% Predict the label of an input given a trained neural network

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

% forward propagation
input_layer = X';
hidden_layer = sigmoid(Theta1*input_layer);
hidden_layer1 = [ones(1,m); hidden_layer];
output_layer = sigmoid(Theta2*hidden_layer1);

% predict label for training examples
[~, index_max] = max(output_layer, [], 1);

% vector with labels (1..num_labels)
p = index_max';

end
