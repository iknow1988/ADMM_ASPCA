function [proj] = ADMM_SPCA(S, lambda, d,rou)

p = size(S,1);
%rou = 0.1 * max(max(abs(S))); %search step size
%rou = 0.005;
%rou = 0.01;
%eps = d*.00001;
%eps = d*.0001;
eps = d*.001;
X = zeros(p,p);
Y = zeros(p,p);
Y0 = zeros(p,p);
U = zeros(p,p);
U0 = zeros(p,p);
niter = 0;
maxnorm = eps+1;
rouStep = 2;

while(maxnorm > eps)
    
    % update X
    X = FantopeProjection(Y0-U0+S/rou, d);
    % update Y
    Y = SoftThreshold(X + U0,lambda, rou);
    % update U
    U = U0 + X - Y;
    % stop criterion
    normr1 = (norm(X-Y, 'fro'))^2;
    norms1 = (rou*norm((Y-Y0), 'fro'))^2;
    maxnorm = max(normr1, norms1);
    niter = niter+1;
    % update
    Y0 = Y;
    U0 = U;
    %     if(normr1>100*norms1)
    %         rou = rou*rouStep;
    %         U0 = U/rouStep;
    %     else
    %         if (norms1>100*normr1)
    %             rou = rou/rouStep;
    %             U0 = U*rouStep;
    %         else
    %             U0 = U;
    %         end
    %     end
    proj = Y;
    %     disp(proj);
    %disp(strcat('iteration ',num2str(niter)));
    %     disp(X);
    %     disp(Y);
    %     disp(U);
end