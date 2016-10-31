addpath (genpath('./'));
X1 = load('../data/german.txt');
X2 = load('../data/mnist.txt');
Purity = zeros(2, 4);
Gini_index = zeros(2, 4);
K = [3 6 9];
[purity, gini_index] = k_medoids_main(X1, 2);
Purity(1, 1) = purity;
purity 
gini_index
Gini_index(1, 1) = gini_index;
[purity, gini_index] = k_medoids_main(X2, 10);
purity 
gini_index
Purity(2, 1) = purity;
Gini_index(2, 1) = gini_index;
for i = 1:length(K)
    [purity, gini_index] = spectral(X1, K(i), 2);
    Purity(1, i + 1) = purity;
    Gini_index(1, i + 1) = gini_index;
    purity 
    gini_index
    [purity, gini_index] = spectral(X2, K(i), 10);
    Purity(2, i + 1) = purity;
    Gini_index(2, i + 1) = gini_index;
    purity 
    gini_index
end
Purity
Gini_index