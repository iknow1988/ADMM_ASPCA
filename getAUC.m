function [TPR,FPR,TH,auc,XData,YData] = getAUC(projection,label)
prjIn1to0 = projection'/max(projection);
[TPR,FPR,TH]=roc(label',prjIn1to0);
TH = TH*max(projection);
auc = trapz(FPR,TPR);
if auc > 0.8
    below10percent = find(FPR>0.196);
else
    below10percent = length(FPR);
end
XData = FPR(1:below10percent);
YData = TPR(1:below10percent);
%plotroc(label',prjIn1to0);
end