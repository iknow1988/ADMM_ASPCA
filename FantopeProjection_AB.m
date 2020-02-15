function [newmat] = FantopeProjection_AB(mat, ndim)
[V, D] = svd(mat);
D = -diag(D);
theta = GetBestTheta(D, ndim);
newD = min(max(D-theta, 0),1);
newmat = V*diag(newD)*V';
% newD = getAnotherTheta(D, ndim);
% newmat = V*diag(newD)*V';
end