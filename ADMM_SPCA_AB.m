function [proj] = ADMM_SPCA_AB(S, lambda, d,rou)

p = size(S,1);
eps = d*.001;
X = zeros(p,p);
Y = zeros(p,p);
Y_t = zeros(p,p);
Y_t_1 = zeros(p,p);
U = zeros(p,p);
niter = 0;
maxnorm = eps+1;

while(maxnorm > eps)
    Y_t_1 = Y_t;
    X_t = X;
    Y_t = Y;
    % update X
    X = FantopeProjection_AB(Y-U-S/rou, d);
    % update Y
    Y = SoftThreshold(X + U,lambda, rou);
    % update U
    U = U + X - Y;
    
    % stop criterion
    if(niter)
        norm1 = (norm(X_t-Y_t, 'fro'))^2;
        norm2 = (norm(rou*(Y_t-Y_t_1), 'fro'))^2;
        maxnorm = max(norm1, norm2);
    end
    niter = niter+1;
%     if(mod(niter,3000)==0)
%         disp(strcat('IN ADMM -> iteration = ',num2str(niter)));
%     end
    proj = Y;
end
disp(strcat('IN ADMM -> iteration = ',num2str(niter)));
end