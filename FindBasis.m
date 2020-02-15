function [eigV] = FindBasis(Data,proj,S,anomalies,d)

[V,D] = eig(realsym(proj));

D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
V = V(:,1:d);

%V= V*V';
% [V1, D1] = eig(realsym(V'*S*V));
% D1=diag(D1);
% [a, id] = sort(D1, 'descend');
% V1 = V1(:,id);
% D1 = D1(id);
% eigV = V*V1;
% display('ADMM');
% E = norm(eye(d)-eigV'*eigV,'fro')
eigV = V;

%heatmap
% heatmap = anomalies*eigV(:,4:7);
% subplot(4,2,8);
% imagesc(heatmap);
% colorbar;
% title('Heatmap of projection values of anomalies on SPCA residual PCs');
% xlabel('Last 4 PCs') % x-axis label
% ylabel('Abnormal Records') % y-axis label
% disp('PCs')
% disp(eigV)
end