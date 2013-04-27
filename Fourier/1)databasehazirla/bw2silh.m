function [bws, ims] = bw2silh(bw, im, dbg)
% function [bws, ims] = bw2silh(bw, dbg)
% 
% bw goruntuden en buyuk alana sahip olan insana ait
% silhouette'i cikarir

L = bwlabel(bw);
s = regionprops(L, 'area');
areas = cat(1, s.Area);

[mx, ind] = max(areas);

bws = bw; %?
bws(L ~= ind) = false;
bws(L == ind) = true;

m3 = cat(3, bws, bws, bws);
ims = uint8(double(im) .* double(m3));