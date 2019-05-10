function [C, sigma] = dataset3Params(X, y, Xval, yval)
% returns  the optimal C, sigmaa learning parameters for SVM with RBF kernel
% based on CV set

C = 1;
sigma = 0.3;

posVal = [0.01, 0,03, 0.1, 0.3, 1, 3, 10, 30];
[posC, posS] = meshgrid(posVal, posVal);
posComs = [posC(:) posS(:)];
cvErrors = zeros(size(posComs, 1), 1);

for i = 1:size(posComs,1)
    model= svmTrain(X, y, posComs(i,1), @(x1, x2) gaussianKernel(x1, x2, posComs(i,2)));
    predictions = svmPredict(model, Xval);
    cvErrors(i) = mean(double(predictions ~= yval));
end

[~, minIndex] = min(cvErrors);

C = posComs(minIndex, 1);
sigma = posComs(minIndex, 2);

end
