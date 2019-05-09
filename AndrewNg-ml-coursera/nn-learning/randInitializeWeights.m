function W = randInitializeWeights(L_in, L_out)
% Randomly initialize the weights of a layer with L_i incoming connections 
% and L_out outgoing connections
% W - matrix of size(L_out, 1 + L_in), first W column contains
% paramters for bias unit

W = zeros(L_out, 1 + L_in);

epsilon_init = 0.12;
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

end
