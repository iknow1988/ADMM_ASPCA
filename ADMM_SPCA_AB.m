function [proj] = ADMM_SPCA_AB(S, lambda, d,rou)

p = size(S,1);
eps = d*.001;
X = zeros(p,p);
Y = zeros(p,p);
Y0 = zeros(p,p);
U = zeros(p,p);
U0 = zeros(p,p);
niter = 0;
maxnorm = eps+1;

while(maxnorm > eps)
    % update X
    X = FantopeProjection_AB(Y-U-S/rou, d);
    % update Y
    Y = SoftThreshold(X + U,lambda, rou);
    % update U
    U = U + X - Y;
    % stop criterion
    norm1 = (norm(X-Y, 'fro'))^2;
    norm2 = (rou*norm((Y-Y0), 'fro'))^2;
    maxnorm = max(norm1, norm2);
    
    niter = niter+1;
    proj = Y;
end