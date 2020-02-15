function [Data,anomalies, label,S, lambda,d, rou] = localdataset(dataset)
Data = zeros();
anomalies = zeros();
lambda = 0;
d=0;
label = zeros();
S = zeros;
rou = 0.01;
switch dataset
    case 1
        %         d=0;
        d=3;
        %lambda = 0.06;
        lambda = 0.35;
        %         lambda = 0.0;
        [Data,anomalies] = GenerateData();
        %         n = size(Data,1);
        %         p = size(Data,2);
        %         Datamu = mean(Data,1);
        %         S = Data-repmat(Datamu,n,1); % center data
        %         S = S'*S/n;
        label = zeros(size(Data,1),1);
        label(1:500) = 0;
        label(501:515) = 1;
        S= Data'*Data;
    case 2
        d=4;
        lambda = 0.8;
        [Data,anomalies] = GenerateData1();
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        S = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 3
        d=3;
        lambda = 0.55;
        A = importdata('wine.data');
        label = A(:,1);
        Data = A(:,2:end);
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        S = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 4
        d=3;
        lambda = 4;
        A = importdata('20news.mat');
        Data = (A.documents)';
        Data = full(double(Data));
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        S = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 5
        d=10;
        %         d=10;
        %lambda = 0.2;
        %lambda = 4.40;
        lambda = 5.00;
        rou = 0.005;
        Data = importdata('breast.mat');
        label = zeros(size(Data,1),1);
        label(1:357) = 0;
        label(358:end) = 1;
        anomalies = Data(358:367,:);
        S = Data'*Data;
    case 6
        d=17;
        lambda = 4;
        Data = importdata('spam.data');
        S = Data'*Data;
    case 7
        d=18;
        lambda = 600.0;
        rou = 50;
        Data = importdata('kdd.mat');
        anomalies = Data(97248:end,:);
        label = zeros(size(Data,1),1);
        label(1:97247)=0;
        label(97248:end) = 1;
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        S = Data-repmat(Datamu,n,1); % center data
        S = S'*S;
        
        %         S = Data'*Data;
    case 8
        d=1;
        lambda = 5;
        loadData = importdata('ex8data1.mat');
        Data= loadData.Xval;
        anomalies = Data(find(loadData.yval==1),:);
        label = zeros(size(Data,1),1);
        label(find(loadData.yval==0))=0;
        label(find(loadData.yval==1)) = 1;
        S = Data'*Data;
    case 9
        d=10;
        lambda = 0.35;
        loadData = importdata('ex8data2.mat');
        Data= loadData.Xval;
        anomalies = Data(find(loadData.yval==1),:);
        label = zeros(size(Data,1),1);
        label(find(loadData.yval==0))=0;
        label(find(loadData.yval==1)) = 1;
        S = Data'*Data;
    case 10
        d=1;
        lambda = 14.5;
        rou = 0.005;
        load iris_dataset
        Data = irisInputs';
        label = ~irisTargets';
        label = label(:,3);
        anomalies = Data(find(label==1),:);
        S = Data'*Data;
    otherwise
        warning('Unexpected dataset.')
end
end