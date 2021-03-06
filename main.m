addpath aspca
% %take input
% % prompt = 'please chose the dataset.\n 1. Synthetic Dataset 1.\n 2. Synthetic Dataset 2.\n 3. Wine Dataset.\n 4. News Dataset.\n 5. Breast Dataset.\n';
% %x = input(prompt);
x = 7;
%load data
[Data,anomalies, label,S, lambda,d, rou] = localdataset(x);
test=[];

test = startTest(test,Data,anomalies, label,S, lambda,d,rou);
test = newTest(test,Data,anomalies, label,S, lambda,d,rou,x);
switch x
    case 1
        dataset = 'Synthetic Dataset';
    case 5
        dataset = 'Breast Cancer Dataset';
    case 7
        dataset = 'KDD99 10% Dataset';
    case 10
        dataset = 'Iris Dataset';
    otherwise
        warning('Unexpected dataset.')
end
str = strcat(dataset,', lambda = ',num2str(lambda),', Normal Subspace dimension d = ',num2str(d),', rou = ',num2str(rou));
supertitle(str,'FontSize',30,'Color','r');

% test = FPRtest(test,Data,anomalies, label,S, lambda,d,rou,x);
% test = sliderTest(test,Data,anomalies, label,S, lambda,d,rou)
%**********************************title**********************************