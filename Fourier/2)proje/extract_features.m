%% documentation 
%
%
function data = extract_features(bw,dbg)
    bw = bw(1:40,:); %% Belirtilen boyut kadar görüntüyü alır keser
    
    dis_kontur = edge(bw,'sobel'); %% Görüntünün kenarlarını bulur
    
    f = fft2(bw); %% Görüntüye fourier uygular
    F = fftshift(f); %% 
    
    df = F.*bw; 
    
    data = imagesc(20*log10(abs(fftshift(f))));
    
    %if dbg
        %figure(1);
            subplot(221), imshow(bw)
            subplot(222), imshow(dis_kontur)
            subplot(223), imshow(log(abs(df)),[])
            subplot(224), imagesc(log(abs(F)))
   % end
end

%% helpers funcs
%
%
