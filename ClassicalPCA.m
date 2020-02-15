function [V,D] = ClassicalPCA(S,d)
[V,D] = eig(S);
D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
V = fliplr(V);
V= V(:,1:d);


[V1,D] = eig(realsym(S));
D = -diag(D);
[a, id] = sort(D, 'descend');
D = D(id);
D = D(1:d,:);
D = -D;
end