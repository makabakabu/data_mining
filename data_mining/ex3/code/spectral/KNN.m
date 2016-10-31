function W = KNN(V, k)
%V为降维后的矩阵
%c为取k个邻居
%W为权重矩阵
[m, ~] = size(V);
W = zeros(m, m);
for i = 1:m
    distance = sqrt(sum(bsxfun(@minus, V( i, : ), V) .^2) );
    [~, index] = sort(distance);
    W( i, index(1 : k + 1) ) = 1;
    W( index(1 : k + 1), i ) = 1;
    W( i, i ) = 0;
end

    
    
