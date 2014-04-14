function [ eigncent ] = eigenvectorcentrality( A )
%EIGENVECTORCENTRALITY Summary of this function goes here
%   Detailed explanation goes here
[V, D] = eig(A);
[~, i] = max(diag(D));

eigncent = abs(V(:, i));

end

