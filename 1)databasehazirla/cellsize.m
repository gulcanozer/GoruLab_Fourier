function sz = cellsize(C, pi, si)
% function sz = cellsize(C, pi, si)
% 
% 'C' cell dizisinin ilgili alt dizisinin boyutunu dondurur.

t = cellfun('prodofsize', C);
t = t ~= 0;

if nargin == 2
    t2 = t(:, :, pi);
    sz = length(find(sum(t2)~=0));
else
    t2 = t(:, si, pi);
    sz = length(find(t2 ~= 0));
end