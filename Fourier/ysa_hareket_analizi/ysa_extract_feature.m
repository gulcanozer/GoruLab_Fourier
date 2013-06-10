
% resimlerin bulundugu dizine gelinir.
feature='*.png';
DIR_feature = dir(feature)
deger = [];

for i=1:length(DIR_feature)
    table= DIR_feature(i).name;
    table=imread(table);
    table=im2bw(table);
    
    f = fft2(table); 
    f_y = abs(f);
    data = sum(f_y(:))/length(f_y(:));
    
    deger(i)= data ;
  

end

save('h3-6.mat','deger')