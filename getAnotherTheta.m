function R = getAnotherTheta(R,d)
n = length(R);
p = n-d;
R(1:p)=0;
s = sum(R);
R = R/s;
end