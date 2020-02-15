function [newmat] = FantopeProjection(mat, ndim)

mat = real((mat'+mat)/2);
[V, D] = eig(mat);
D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
theta = GetTheta(D, ndim);
newD = min(max(D-theta, 0),1);
newmat = V*diag(newD)*V';

end
