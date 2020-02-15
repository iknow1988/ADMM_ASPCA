function [theta] = GetTheta(v, ndim)
% if ((v(ndim)-v(ndim+1))>1 ||(v(ndim)-v(ndim+1)) == 1)
%     theta = v(ndim)-1;
%     return;
% end
p = length(v);
v1 = 1:(p+1);
v1(1:p) = v;
v1(p+1) = v(p)-ndim/p;
ddnew = 0;
fnew = 0;
dnew = max(ndim-2,0);
while (fnew < ndim)
    f = fnew;
    dd = ddnew;
    d = dnew;
    dnew = dnew + 1;
    theta = v1(dnew);
    ddnew = find(v1 - theta < 1, 1);
    fnew = (ddnew-1) + sum(v1(ddnew:dnew))-(dnew-ddnew+1)*theta;
end
if (fnew == ndim)
	return;
end
theta = v1(d);
m0 = min(1-(v1(dd)-theta), theta-v1(d+1));
while (f + (d-dd+1)*m0  < ndim)
    
    f = f + (d-dd+1)*m0;
    dd = dd+1;
    theta = theta-m0;
    m0 = min(1-(v1(dd)-theta), theta-v1(d+1));
end
theta = theta - (ndim-f)/(d-dd+1);
end
