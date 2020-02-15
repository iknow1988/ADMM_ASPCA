function [eigV] = FindBasis(Data,proj,S,anomalies,d,label,draw)
[V1,D] = eig(realsym(S));
D = -diag(D);
[a, id] = sort(D, 'descend');
V1 = V1(:,id);
D = D(id);
D = D(1:d,:);
Df = -D;
totV = abs(sum(Df));


[V,D] = eig(realsym(proj));

D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
if(draw)
    draw_dimension(d,V,label,Data,4,3,3,'Data projection on subspaces','Normal Subspace', 'Abnormal Subspace (Logarithmic)');
end
V = V(:,1:d);

V= V*V';
[V,D] = eig(realsym(V));
D = diag(D);
[a, id] = sort(D, 'descend');
V = V(:,id);
D = D(id);
V = V(:,1:d);

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
Dg = diag(eigV'*S*eigV);
[a, id] = sort(Dg, 'ascend');
Dg = Dg(id);
FVE = sum(Dg)/totV;
end