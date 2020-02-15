function [XData,YData] = FPRtest(test,Data,anomalies, label,S, lambda,d,rou,x)
test.isNew = isempty(test);
test.lambda=lambda;
test.d = d;
test.rou = rou;
test.abnormalD = size(Data,2) - d;
test.n = size(Data,1);
test.p = size(Data,2);
X = zeros(test.p,1);
Y = zeros(test.p,1);
for n = 1:test.p
    test.ClassicPC = ClassicalPCA(S);
    test.ClassicPC = fliplr(test.ClassicPC);
    test.ClassicPC = test.ClassicPC(:,1:n);
    test.aspcabPC = spcaf(S,lambda*100,test.p-n);
    test.ADMMProjection = ADMM_SPCA_AB(S,lambda,test.p-n,rou);
    test.ADMMPC = FindBasis(Data,test.ADMMProjection,S,anomalies,test.p-n);
    
    yProjected = (Data*test.ADMMPC).^2;
    test.SPE = sum(yProjected,2);
    
    yProjectedClassic = (Data*test.ClassicPC).^2;
    test.SPEClassic = sum(yProjectedClassic,2);
    
    yProjectedASPCA = (Data*test.aspcabPC).^2;
    test.SPEASPCA = sum(yProjectedASPCA,2);
    
    X(n) = n;
    [TPR,FPR,TH,auc,XData,YData] = getAUC(test.SPE,label);
    Y(n,1) = FPR;
    [TPR,FPR,TH,auc,XData,YData] = getAUC(test.SPEClassic,label);
    Y(n,2) = FPR;
    [TPR,FPR,TH,auc,XData,YData] = getAUC(test.SPEASPCA,label);
    Y(n,3) = FPR;
    display(strcat('iteration = ', num2str(n)));
end
dataset = 'Unexpected';
switch x
    case 1
        dataset = 'Synthetic Dataset';
    case 5
        dataset = 'Breast Cancer Dataset';
    case 7
        dataset = 'KDD99 10% Dataset';
    otherwise
        warning('Unexpected dataset.')
end

plot(X,Y);
xlabel('# of normal components');
ylabel('FPR');
title(dataset);
legend('ADMM', 'Classical PCA','ASPCA-B');
end