function [purity, gini_index] = k_medoids_main(X, k)
[m, n] = size(X);
y = X(:, n);
X = X(:, 1:n-1);
least = m*n;
C_best = ones(m, 1);
for i = 1:10
    seed_index = randi([1, m], k, 1);
    [J, C] = k_medoids(X, seed_index);
    if least > J
        least = J;
        C_best = C;
    end
end
index = unique(y);
real_k = length(index);
freq = 0;
prob = 0;
for i = 1:real_k
    i_index_label= C_best( find( y == index( i ) ) );
    length_tmp = length( i_index_label );
    [freq_tmp, ~] = max( histc( i_index_label, min( i_index_label ) : 1 : max( i_index_label ) ) );
    freq = freq + freq_tmp;
    prob = prob + freq_tmp * freq_tmp * (length_tmp - freq_tmp);
end
purity = freq / length(y);
gini_index = prob / length(y) ^3;

    
