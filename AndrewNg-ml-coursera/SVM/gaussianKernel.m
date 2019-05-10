function sim = gaussianKernel(x1, x2, sigma)
% Gaussian kernel between x1 and x2, similarity function
% sigma - bandwidth parameter

x1 = x1(:); x2 = x2(:);

sim = 0;

dif_vector = x1 - x2;
squared_dif_vector = dif_vector.^2;
enumerator = sum(squared_dif_vector);
denominator = 2*(sigma.^2);
sim = sim + exp(-enumerator/denominator);
    
end
