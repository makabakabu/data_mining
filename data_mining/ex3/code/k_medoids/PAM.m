function value = PAM(X_rest, seed, m, k)
%X_restΪδѡ�����ĵ�
%seedΪѡ�е����ĵ�
%mΪ�����������ά��
%kΪ���ĵ�ά��
%value ��С�ĵ�m - k��ֵ��ӵĴ�С
tmp = ones(m -k, k);
for i = 1:k
    tmp(:, i) = sum(abs(bsxfun(@minus, X_rest, seed(i, :))), 2);
end
value = sum(min(tmp,[],2));
end
    
    
        
    