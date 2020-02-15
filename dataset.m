function [Data,anomalies, label,S, lambda,d] = dataset(dataset)
Data = zeros();
anomalies = zeros();
lambda = 0;
d=0;
label = zeros();
S = zeros;
switch dataset
    case 1
        d=4;
        lambda = 0.3;
        [Data,anomalies] = GenerateData();
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        Data_c = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 2
        d=4;
        lambda = 0.4;
        [Data,anomalies] = GenerateData1();
        [Data,anomalies] = GenerateData();
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        Data_c = Data-repmat(Datamu,n,1); % center data
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
        Data_c = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 4:
        A = importdata('20news.mat');
        Data = (A.documents)';
        Data = double(Data);
        n = size(Data,1);
        p = size(Data,2);
        Datamu = mean(Data,1);
        Data_c = Data-repmat(Datamu,n,1); % center data
        S = S'*S/n;
    case 5
        d=17;
        lambda = 4;
        Data = importdata('train.mat');
        S = Data'*Data;
    otherwise
        warning('Unexpected dataset.')
end
end