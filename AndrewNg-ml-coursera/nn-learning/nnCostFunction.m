function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
% Cost function for a two layer neural network

% Weight matrices for 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% expanding y-vector into Y-matrix (m, num_labels)
eye_matrix = eye(num_labels);
y_matrix = eye_matrix(y,:);

X = [ones(m, 1) X];

%forward propagation

a1 = X';
z2 = Theta1*a1;
a2 = sigmoid(z2);

a2 = [ones(1,m); a2];

z3 = Theta2*a2;
a3 = sigmoid(z3);

h = a3';

%cost

J = J + 1/m*sum(sum((-y_matrix.*log(h) - (1-y_matrix).*log(1-h))));

%regularized

thetaWithoutBias1  = Theta1(:, 2:end);
thetaUnrolled1 = thetaWithoutBias1(:);
theta1reg = sum(thetaUnrolled1.^2);

thetaWithoutBias2  = Theta2(:, 2:end);
thetaUnrolled2 = thetaWithoutBias2(:);
theta2reg = sum(thetaUnrolled2.^2);

regTerm = (lambda/2/m)*(theta1reg + theta2reg);

J = J + regTerm;

%back propagation

d3 = h - y_matrix;
d2 = d3*Theta2(:, 2:end).*(sigmoidGradient(z2))';

delta1 = d2' * a1';
delta2 = d3' * a2';

Theta1_grad = Theta1_grad + 1/m*delta1;
Theta2_grad = Theta2_grad + 1/m*delta2;

%back propagation regularization

Theta1(:,1) = 0;
Theta2(:,1) = 0;
Theta1 = lambda/m*Theta1;
Theta2 = lambda/m*Theta2;
Theta1_grad = Theta1_grad + Theta1;
Theta2_grad = Theta2_grad + Theta2;

grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
