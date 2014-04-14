function [ cluscoef ] = clusteringcoefficient( A )
% cluster coefficient of node i is simplely
% [number of edges between adjacent nodes for node i] /
% [ (degree of i) * ( (degree of i) -1 ) ]
%
% c.f. average cc is sum(C) / n

numNode = size(A,1);
cluscoef = zeros(numNode,1);
nodeList = (1:numNode);

A = A > 0;
degrees = degree(A);

for node=1:numNode
    if degrees(node) == 1 || degrees(node) == 0
        continue;
    end
    
    adjNode = nodeList(logical(A(:,node)));
    n = sum(sum(A(adjNode, adjNode)));
    
    cluscoef(node) = n / degrees(node) / (degrees(node)-1);
end
