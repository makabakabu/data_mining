function [J, C] = k_medoids(X, seed_index)
%X -特征矩阵
%X_seed 随机选出的k个特征向量
%J -畸变函数
%C -描述所有点的特征点
%center -特征点
%将X分为k类
[m, ~] = size(X);
seed = X(seed_index, :);
X_rest = X;
X_rest(seed_index, :) = [];
k = length(seed_index);
C = ones(m , 1);
for i = 1:k
    tmp = ones(m - k +1, 1);
    tmp(1) = PAM(X_rest, seed, m, k);
    X_rest_tmp = X_rest;
    seed_tmp = seed;
    for j = 1:m - k
        vector_tmp = seed_tmp(i, :);
        seed_tmp(i, :) = X_rest_tmp(j, :);
        X_rest_tmp(j, :) = vector_tmp;
        tmp(j + 1) = PAM(X_rest_tmp, seed_tmp, m, k);
    end
    [~, index] = min(tmp);
    if index ~= 1
        vector_tmp = seed(i, :);
        seed(i, :) = X_rest(index - 1, :);
        X_rest(index - 1, :) = vector_tmp;
    end
end
for i = 1:m
    [~, index] = min(sum(abs(bsxfun(@minus, X(i, :), seed)), 2));
    C(i) = index;
end
J = sum(sqrt(sum(abs(X - X(C, :)) .^2)));




