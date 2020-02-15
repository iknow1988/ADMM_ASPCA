function [Data,anomalies] = GenerateData1()
% V1 = normrnd(0,290,500,1);
% V2= normrnd(0,300,500,1);
% e = normrnd(0,1,500,1);
% V3= 0.3*V1+0.925*V2+e;
% X1= V1+normrnd(0,1,500,1);
% X2= V1+normrnd(0,1,500,1);
% X3= V1+normrnd(0,1,500,1);
% X4= V1+normrnd(0,1,500,1);
% X5= V2+normrnd(0,1,500,1);
% X6= V2+normrnd(0,1,500,1);
% X7= V2+normrnd(0,1,500,1);
% X8= V2+normrnd(0,1,500,1);
% X9= V3+normrnd(0,1,500,1);
% X10= V3+normrnd(0,1,500,1);
% 
% Data = [X1 X2 X3 X4 X5 X6 X7 X8 X9 X10];
loaded = importdata('synthetic2.mat');
Data = loaded.Data;
anomalies = zeros();
end