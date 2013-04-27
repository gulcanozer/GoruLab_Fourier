function [bwsc, imsc] = bwscrop(bws, ims, dbg)
% function [bwsc, imsc] = bwscrop(bws, ims, dbg)
% 
% silhouette resmini (bws) cirp

L = bwlabel(bws);
s = regionprops(L, 'boundingbox');
bbox = round(cat(1, s.BoundingBox));

bwsc = imcrop(bws, bbox);
imsc = imcrop(ims, bbox);

if dbg
    figure(99);
    subplot(121);
        imshow(bws);
        hold on;
        rectangle('Position', bbox, 'EdgeColor', 'g', 'LineWidth', 1);
        hold off;
    subplot(122);
        imshow(ims);
        hold on;
        rectangle('Position', bbox, 'EdgeColor', 'g', 'LineWidth', 1);
        hold off;
          
end