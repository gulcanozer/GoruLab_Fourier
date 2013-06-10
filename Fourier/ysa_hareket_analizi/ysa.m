% Youtube Videosu : http://www.youtube.com/watch?v=Ab2hI8T2fpA 

DIR_f = './npr/';
feature = '*.mat'; 
giris=[];

DIR_feature = dir(strcat(DIR_f, feature)); %klasordeki tum .mat uzamtýlarý çek
sz = length(DIR_feature);  
for i=1:sz
  table=load( strcat(DIR_f, DIR_feature(i).name)); %i.ci sýradaki .mat dosyasýný yükle
  sonuc = sum(table.deger)/length(table.deger); 
  giris(i) = sonuc; 
end 

cikis=[]; 
for i=1:length(giris)
    if giris(i)>9       
        cikis(i,:)= [1 0 0];   %  3: digging  
    elseif giris(i)< 7      
        cikis(i,:)= [0 1 0];   %  1: pointing
    else
        cikis(i,:)=[0 0 1];    %  2: standing
    end
end

cikis=(cikis');  
 
% Create Network
numHiddenNeurons = 20;  % Adjust as desired

net = newpr(giris,cikis,numHiddenNeurons);

net.divideParam.trainRatio = 60/100;  % Adjust as desired
net.divideParam.valRatio = 15/100;  % Adjust as desired
net.divideParam.testRatio = 25/100;  % Adjust as desired
net.trainParam.epochs = 40;

% Train and Apply Network
[net,tr] = train(net,giris,cikis);
outputs = sim(net,giris);

% Plot
plotperf(tr)
plotconfusion(cikis,outputs)


 