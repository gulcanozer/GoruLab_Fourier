DIR_f = './egitim/'; %egitim diznini tanýmla
feature = '*.mat'; % tüm .mat uzantýlý dosyalar
giris=[]; % tum giriþlerin tutulduðu matrýs

DIR_feature = dir(strcat(DIR_f, feature)); %klasordeki tum .mat uzamtýlarý çek
sz = length(DIR_feature); % klasorde .mat sayýsý 
for i=1:sz
  table=load( strcat(DIR_f, DIR_feature(i).name)); %i.ci sýradaki .mat dosyasýný yükle
  sonuc = sum(table.deger)/length(table.deger); % i.ci sýradaki .mat dosyasýnýn ortalamasýný al
  giris(i) = sonuc; 
end
d=(giris-min(giris))/(max(giris)-min(giris));   % normalizasyon aþamasý - deðer 0-1 arasýna atýlýr.

cikis=[]; 
for i=1:length(d)
    if d(i)==1       
        cikis(i,:)= [0 0];   % digging (databasehazýrla klasöründeki README.md deki ilk 3 hareketler)
    elseif d(i)==0      
        cikis(i,:)= [0 1];   % standing  
    else
        cikis(i,:)=[1 0];   % pointing 
    end
end
 
cikis=(cikis');    % network her býr satýrýn ýlk ozelliðimi alcaðý için ilk sutundaki veriler bir resme ait olmalý bu nedenle transpozasý alýndý.
 
%YSA’nin tasarimi, egitimi ve simulasyonu
net = newff(minmax(d),[3 4 2],{'tansig','logsig','purelin'},'trainlm', 'learngdm');
net = train(net,d,cikis);

an = sim(net,d);  %simulasyon aþamasý

%Egitim verilerinin gercek ve YSA cikisinin gosterimi
figure(1),plot(d,cikis,'o');
hold on,plot(d,an,'r*'),grid on;
legend('Gerçek deger','YSA cikisi'),xlabel('grs'),ylabel('cks'),title('Egitim verisi')


%test etme
DIR_t = './test/';  

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
    if d_t(i)==1       
        cikis_t(i,:)= [0 0];
    elseif d_t(i)==0      
        cikis_t(i,:)= [0 1];
    else
        cikis_t(i,:)=[1 0];
    end
end


atn = sim(net,d_t);  %simulasyon aþamasý


%Test verilerinin gercek ve YSA cikisinin gosterimi
figure(2),plot(giris_t,cikis_t,'o');
hold on,plot(giris_t,atn,'r*'),grid on;
legend('Gerçek deger','YSA cikisi'),xlabel('giris_t'),ylabel('cikis_t'),title('Test verisi')
 