function W = KNN(V, k)
%VΪ��ά��ľ���
%cΪȡk���ھ�
%WΪȨ�ؾ���
[m, ~] = size(V);
W = zeros(m, m);
for i = 1:m
    distance = sqrt(sum(bsxfun(@minus, V( i, : ), V) .^2) );
    [~, index] = sort(distance);
    W( i, index(1 : k + 1) ) = 1;
    W( index(1 : k + 1), i ) = 1;
    W( i, i ) = 0;
end

    
    
