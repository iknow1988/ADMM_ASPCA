function [V] = ClassicalPCA(S)
[V,D] = eig(S);
D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
V = fliplr(V);
end