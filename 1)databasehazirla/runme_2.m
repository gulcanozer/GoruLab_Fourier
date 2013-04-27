%% BW 64x64 generation
clear all; close all; clc;
dbg = ~true;

load('../_db/datastore.mat');

db_sdha = '../_db/sdha2010-ut-tower/';
db_sdha_fg = strcat(db_sdha, '/Foreground_Masks/');
db_sdha_vf = strcat(db_sdha, '/Video_Frames/');

db = '../_db/';                 mkdir(db); 
db_64x64 = '../_db/64x64/';     mkdir(db_64x64);
db_64x64_fg = '../_db/64x64/Foreground_Masks/';         mkdir(db_64x64_fg);
db_64x64_vf = '../_db/64x64/Video_Frames/';             mkdir(db_64x64_vf);
db_64x64_of = '../_db/64x64/Our_Foreground/';           mkdir(db_64x64_of);

ds_64x64 = '../_db/datastore_64x64.mat';

if exist(ds_64x64) > 0
%    fprintf('%s dosyasi zaten var. Geri donuyorum...\n', ds_64x64);
%    return
end

psz = size(etiket, 3);
for pi=1:psz
    if dbg, fprintf('%03d/%03d. kisi isleniyor...\n', pi, psz); end

    ssz = cellsize(etiket, pi);
    for si=1:ssz
        if dbg, fprintf('\t%1d/%1d. seq isleniyor...\n', si, ssz);  end

        clear seq_frms;
        fsz = cellsize(etiket, pi, si);
        for fi=1:fsz
            if dbg, fprintf('\t\t%03d/%03d. frame isleniyor...\n', fi, fsz);    end
            
            fnm = fg_fnms{fi, si, pi};
            bw = imread(strcat(db_sdha_fg, fnm));
            bw = (bw > 128);
            
            im = imread(strcat(db_sdha_vf, vf_fnms{fi, si, pi}));
            
            %% OUR: Segmentation Method
            % bw goruntude en buyuk alanliya/insana gore crop et
            s = regionprops(bw, 'boundingbox', 'area');
            bbox = cat(1, s.BoundingBox);
            areas = cat(1, s.Area);
            [~, ind] = max(areas);
            R = bbox(ind, :);
            
            t = imcrop(im, R);
            x = rgb2gray(t);
            img = ones(size(im))*255;
            img = img(:,:,1);
            R = ceil(R);
            
            img(R(2):R(2)+R(4),R(1):R(1)+R(3)) = x;
            mask = 1 - double(im2bw(img/255, graythresh(x)));
            
            % rgb'den elde edilen icerisinde ki insani sec
            L = bwlabel(logical(mask));
            s = regionprops(L, 'area');
            areas = cat(1, s.Area);
            [~, ind] = max(areas);
            bwof = ismember(L, ind);
            
            imshow(mask);
            [bws, ims] = bw2silh(bwof, im, dbg);
            [bwsc, imsc] = bwscrop(bws, ims, dbg);
            [bwof64x64,  ~] = bwsresize(bwsc, imsc, dbg);
            
            %% Devam
            [bws, ims] = bw2silh(bw, im, dbg);
            [bwsc, imsc] = bwscrop(bws, ims, dbg);
            [bw64x64, im64x64] = bwsresize(bwsc, imsc, dbg);
            
            [t, nm] = fileparts(fnm);
            fnm_64x64 = strcat('db64x64_', nm, '.png');
            
            imwrite(bw64x64, strcat(db_64x64_fg, fnm_64x64));
            imwrite(im64x64, strcat(db_64x64_vf, fnm_64x64));
            imwrite(bwof64x64, strcat(db_64x64_of, fnm_64x64));
            
            db64x64_fnms{fi, si, pi} = fnm_64x64;
            
            if dbg
                % Ornek kayit: http://screencast.com/t/uoihPvb3o1
                figure(1);
                subplot(221);   imshow(bw);         title('BW: databasede olan');
                subplot(222);   imshow(im);         title('RGB');
                subplot(223);   imshow(bwof64x64);  title('BW: OUR');
                subplot(224);   imshow(bw64x64);    title('BW: Ham');
                drawnow;
            end
        end
    end
end

%% Save
save(ds_64x64, 'db64x64_fnms', 'fg_fnms', 'vf_fnms', 'etiket');
