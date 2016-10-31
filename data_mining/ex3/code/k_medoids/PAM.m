function value = PAM(X_rest, seed, m, k)
%X_rest为未选中中心点
%seed为选中的中心点
%m为所有特征点的维数
%k为中心点维数
%value 最小的的m - k个值相加的大小
tmp = ones(m -k, k);
for i = 1:k
    tmp(:, i) = sum(abs(bsxfun(@minus, X_rest, seed(i, :))), 2);
end
value = sum(min(tmp,[],2));
end
    
    
        
    