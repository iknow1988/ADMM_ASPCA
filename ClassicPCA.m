function [V] = ClassicPCA(S)
[V,D] = eig(S);
D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
end