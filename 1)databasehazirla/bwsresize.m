function [bwr, imr] = bwsresize(bws, ims, dbg)
% function [bwr, imr] = bwsresize(bws, dbg)
% 
% bws resmini 64x64'lik kare resme kucult
try
    [bwr, imr] = helper(bws, ims);
catch
    bws = bws'; ims = transpose3d(ims);
    [bwr, imr] = helper(bws, ims);
    bwr = bwr'; imr = transpose3d(imr);
end

function [bwr, imr] = helper(bws, ims)
% bws'nin yuksekligi 64 olacak sekilde olcekle.
bwr = imresize(bws, [64, NaN]);
imr = imresize(ims, [64, NaN]);

L = bwlabel(bwr);
s = regionprops(L,'centroid');
centroids = round(cat(1, s.Centroid));

W = size(bwr, 2);
cn = centroids(1);
sh = round(W/2 - cn);

psz = floor((64 - W)/2);
bwr = padarray(bwr, [0 psz], 0, 'both');
imr = padarray(imr, [0 psz], 0, 'both');
bwr = padarray(bwr, [0 (64 - size(bwr,2))], 0, 'post');
imr = padarray(imr, [0 (64 - size(bwr,2))], 0, 'post');

bwr = circshift(bwr, [0 sh]);
imr = circshift(imr, [0 sh]);

function J = transpose3d(RGB)
for i=1:3
    J(:,:,i) = RGB(:,:,i)';
end