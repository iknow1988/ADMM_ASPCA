function draw_dimension(d,V,label,Data,c,r,p,ttle,x,y)
f = subplot(c,r,p);
normal_index = find(label==0);
normal_index = normal_index';
abnormal_index =find(label==1);
abnormal_index = abnormal_index';
threshold = d;
project = Data*V;
project = project.*project;
hold on;
XData = sum(project(normal_index,threshold+1:end),2);
YData = sum(project(normal_index,1:threshold),2);
semilogy(XData,YData,'g.');
XData = sum(project(abnormal_index,threshold+1:end),2);
YData = sum(project(abnormal_index,1:threshold),2);
semilogy(XData,YData,'r.');
set(gca,'yscale','log');
xlabel(x);
ylabel(y);
title(ttle);
legend('Normal','Abnormal');
hold off;
end