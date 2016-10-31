function [purity, gini_index] = spectral(X, k, c)
addpath (genpath('../'));
%XΪԴ����
%kΪKNN��K
%cΪ��ά���ά��
[~, n] = size(X);
X = X(:, 1: n-1);
W = KNN(X, k);
D = diag(sum(W));
L = D - W;

opt = struct('issym', true, 'isreal', true);
[V,~] = eigs(L, D, c, 'SM', opt);

[purity, gini_index] = k_medoids_main(V, c);