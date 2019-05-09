function p = predictOneVsAll(all_theta, X)
% Predict the label for a trained one-vs-all classifier

m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

predict = sigmoid(X*all_theta');
[~, index_max] = max(predict, [], 2);

% vector with labels (1..num_labels)
p = index_max;

end
