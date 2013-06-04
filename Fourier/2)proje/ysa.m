DIR_f = './egitim/'; %egitim diznini tanımla
feature = '*.mat'; % tüm .mat uzantılı dosyalar
giris=[]; % tum girişlerin tutulduğu matrıs

DIR_feature = dir(strcat(DIR_f, feature)); %klasordeki tum .mat uzamtıları çek
sz = length(DIR_feature); % klasorde .mat sayısı 
for i=1:sz
  table=load( strcat(DIR_f, DIR_feature(i).name)); %i.ci sıradaki .mat dosyasını yükle
  sonuc = sum(table.deger)/length(table.deger); % i.ci sıradaki .mat dosyasının ortalamasını al
  giris(i) = sonuc; 
end
d=(giris-min(giris))/(max(giris)-min(giris));   % normalizasyon aşaması - değer 0-1 arasına atılır.

cikis=[]; 
for i=1:length(d)
    if giris(i)>9       
        cikis(i,:)= [0 0];   %  3: digging  (databasehazırla klasöründeki README.md deki ilk 3 hareketler)
    elseif giris(i)< 7      
        cikis(i,:)= [0 1];   %  1: pointing
    else
        cikis(i,:)=[1 0];    %  2: standing
    end
end

cikis=(cikis');
 
%YSA’nin tasarimi, egitimi ve simulasyonu
net = newff(minmax(d),[3 4 2],{'tansig','logsig','purelin'},'trainlm', 'learngdm');

net = train(net,d,cikis);

an = sim(net,d);  %simulasyon aşaması

%Egitim verilerinin gercek ve YSA cikisinin gosterimi
figure(1),plot(d,cikis,'o');
hold on,plot(d,an,'r*'),grid on;
legend('Gerçek deger','YSA cikisi'),xlabel('grs'),ylabel('cks'),title('Egitim verisi')


%test etme
DIR_t = './test/';  % yukardakiyle benzer buraya benzer yorumlar yapın. 

feature_t = '*.mat';
giris_t=[];

DIR_feature_t = dir(strcat(DIR_t, feature_t));
sz = length(DIR_feature_t);
for i=1:sz
  table=load( strcat(DIR_t, DIR_feature_t(i).name));
  sonuc_t = sum(table.deger)/length(table.deger);
  giris_t(i) = sonuc_t; 
end
d_t=(giris_t-min(giris_t))/(max(giris_t)-min(giris_t));

cikis_t=[]; 
for i=1:length(giris_t)
    if giris_t(i) > 9       
        cikis_t(i,:)= [0 0];
    elseif giris_t(i)< 7      
        cikis_t(i,:)= [0 1];
    else
        cikis_t(i,:)=[1 0];
    end
end

giris_t=(giris_t');
cikis_t=(cikis_t');% transpoza nedeni yukardakıyle aynı

atn = sim(net,d_t);  %simulasyon aşaması


%Test verilerinin gercek ve YSA cikisinin gosterimi
figure(2),plot(giris_t,cikis_t,'o');
hold on,plot(giris_t,atn,'r*'),grid on;
legend('Gerçek deger','YSA cikisi'),xlabel('giris_t'),ylabel('cikis_t'),title('Test verisi')
 