function [ eigncent ] = eigenvectorcentrality( A )
% eigenvector centrality. compute eigenvector using eig function

[V, D] = eig(A);
[~, i] = max(diag(D));

eigncent = abs(V(:, i));

end

