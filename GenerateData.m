function[Data,anomalies] = GenerateData()
% normal_num = 500;
% ee = (1:normal_num)';
% a = cos(ee/20);
% b = a;
% c = cos(ee/10);
% d = a+c;
% standA = [a b c d];
% randA = standA + 0.2*rand(normal_num,4);
% e = rand(normal_num,1)*2+cos(ee/2)-1;
% f = rand(normal_num,1)*0.1;
% g = rand(normal_num,1)*0.1;
% randA = [randA e f g];
% 
% anNum = 5;

% an1 = randA(11:10+anNum,:);
% an1(:,2) = rand(anNum,1);
% an2 = randA(31:30+anNum,:);
% an2(:,4) = rand(anNum,1);
% an3 = randA(51:50+anNum,:);
% an3(:,6) = rand(anNum,1);
% anomalies = [an1;an2;an3];
% Data = [randA;an1;an2;an3];

loaded = importdata('workspaces.mat');
randA = loaded.randA;
anomalies=[loaded.an1;loaded.an2;loaded.an3];
Data = [randA;loaded.an1;loaded.an2;loaded.an3]; 
end