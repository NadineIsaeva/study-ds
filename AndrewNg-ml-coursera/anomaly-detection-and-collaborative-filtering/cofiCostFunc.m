function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
% Collaborative filtering cost function

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);
            
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

%        X - num_movies x num_features matrix of movie features
%        Theta - num_users x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta

J = J + sum(sum((((X*Theta' - Y).^2).*R)))/2;


for ind_movie = 1:num_movies
    idx = R(ind_movie, :) == 1;
    Theta_temp = Theta(idx, :);
    Y_temp = Y(ind_movie, idx);
    X_grad(ind_movie, :) = (X(ind_movie, :) * Theta_temp' - Y_temp)*Theta_temp + lambda*X(ind_movie, :);
end

for ind_user = 1:num_users
    idx = R(:, ind_user) == 1;
    X_temp = X(idx, :);
    Y_temp = Y(idx, ind_user);
    Theta_grad(ind_user, :) = (X_temp * Theta(ind_user, :)' - Y_temp)' * X_temp + lambda*Theta(ind_user, :);
end

regTheta = lambda*(1/2)*(sum(sum(Theta.^2)));
regX = lambda*(1/2)*(sum(sum(X.^2)));
J = J + regTheta + regX;

grad = [X_grad(:); Theta_grad(:)];

end

