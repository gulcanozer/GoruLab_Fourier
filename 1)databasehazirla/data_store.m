function data_store(dbnm, ffnm4data, dbg)
%function data_store(dbnm, ffnm4data, dbg)
%
% IN:
%   dbnm: sdha2010 db si
%   ffnm4data: data.mat in tam ismi
% OUT:
%   yok
% Usage:
%     data_store('_db/sdha2010/', '_db/data.mat', true)
%
%  Abbreviation:
% fnm4video = filename-for-video : video karelerinin bulundugu dosya ismi
% fnm4data = filename-for-data : verilerin bulundugu dosya ismi
% dbnm_video = databasename_video : video karelerine erisilen veritabani ismi 
% actID = actionID : eylem numarasi
% seqID = sequenceID : dizi numarasi (kisi + cekim bilgisi icerir)
% frmID = frameID : kare numarasi
% fnms : filenames : dosya isimleri

if exist(ffnm4data) > 0
    fprintf('%s dosyasi zaten var. Geri don\n', ffnm4data);
    return
end

DIR_fg = dir(strcat(dbnm, 'Foreground_Masks/',  '*.jpg'));
DIR_vf = dir(strcat(dbnm, 'Video_Frames/',      '*.bmp'));
sz = length(DIR_fg);

for f=1:sz
    if dbg, fprintf('%04d / %04d. kare isleniyor...\n', f, sz); end;
    
    fnm = DIR_fg(f).name;
  
    % fnm: fg<actID>_<seqID>_<frmID>.jpg
    actID = str2num(fnm(3:4));
    seqID = str2num(fnm(6:7));
    frmID = str2num(fnm(9:11));
    
    personID = floor((seqID - 1) / 2) + 1;
    cekimID  = (actID - 1) * 2 + (2 - mod(seqID, 2));
    
    % fnm_ortak = fnm(3:11);
    fg_fnms{frmID, cekimID, personID} = DIR_fg(f).name;
    vf_fnms{frmID, cekimID, personID} = DIR_vf(f).name;
    etiket{frmID, cekimID, personID} = actID;
end

info.action_name = {'pointing', 'standing', 'digging', 'walking', 'carrying', 'running', 'wave1', 'wave2', 'jumping'};
save(ffnm4data, 'fg_fnms', 'vf_fnms', 'etiket', 'info');

