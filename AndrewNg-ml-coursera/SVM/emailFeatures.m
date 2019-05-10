function x = emailFeatures(word_indices)
% takes in a word_indices vector and produces a feature vector from the word indices
% word_indices - list of indices of the words which occur in one email
% x - binary feature vector that indicates whether a particular word occurs in the email

% Total number of words in the dictionary
n = 1899;

x = zeros(n, 1);

% Load Vocabulary
% vocabList = getVocabList();

for i = 1:n
    for j = 1:length(word_indices)
        if i == word_indices(j)
            x(i) = 1;
        end
    end
end 

end
