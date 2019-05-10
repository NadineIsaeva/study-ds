function X_rec = recoverData(Z, U, K)
% Recovers an approximation of original data that has been reduced to K dimensions

X_rec = zeros(size(Z, 1), size(U, 1));              

X_rec = Z*U(:,1:K)';

end
