%% documentation 
%
%
function data = extract_features(bw,dbg)
    bw = bw(1:40,:); %% Belirtilen boyut kadar görüntüyü alır keser.Bu boyut ise yaklasık olarak
                     %% gölgeden kurtulmak icin belirlenmistir.
    
    dis_kontur = edge(bw,'sobel'); %% Görüntünün kenarlarını bulur
    
    f = fft2(bw); %% Görüntüye fourier uygular
    F = fftshift(f); %% Görüntüyü netleştirmek için sıfır olan frekans bileşenini yeniden düzenler
    
    df = F.*bw; %% Maske ile görüntüyü çarpar
    
    data = imagesc(20*log10(abs(fftshift(f)))); %% Fourieri alınmış görüntüyü düzenler
    
    %if dbg
        %figure(1);
%% Aynı pencerede çoklu çizim yapar
            subplot(221), imshow(bw)
            subplot(222), imshow(dis_kontur)
            subplot(223), imshow(log(abs(df)),[])
            subplot(224), imagesc(log(abs(F)))
   % end
end

%% helpers funcs
%
%
