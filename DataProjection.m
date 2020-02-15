function DataProjection(Data,label)
S = cov(Data);
[V2,D2] = eig(S);
D2 = diag(D2);
[a, id] = sort(D2, 'descend');
V2 = V2(:,id);
D2 = D2(id);
X = Data * V2(:,1);
Y = Data * V2(:,2);
%label = zeros(size(Data,1),1);

% label(1:97248)=1;
% label(97248:end)=2;

% label(1:59)=1;
% label(60:130)=2;
% label(131:178)=3;

% label(1) = 1;
% label(4) = 1;
% label(20) = 1;
% label(28) = 1;
% label(39) = 1;
% label(60) = 1;
% label(72) = 1;
% label(89) = 1;
% label(92) = 1;
% label(93) = 1;

% label(10) = 1;
% label(50) = 1;
% label(301:307) = 1;

% for i=1:5;
%     label(500+i,1) = 1;
% end
% for i=1:5;
%     label(505+i,1) = 2;
% end
% for i=1:5;
%     label(510+i,1) = 3;
% end
subplot(4,3,1);
plot(Data);
title('Original Data in normal space');
xlabel('Samples') % x-axis label
ylabel('Features') % y-axis label
subplot(4,3,2);
scatter(X,Y,35,label,'filled');
title('Data projected in 2 dimension');
xlabel('PC1') % x-axis label
ylabel('PC2') % y-axis label
end