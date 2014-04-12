function [ degree ] = degree( A )
% degree of the node is the number of edges connected to it
% thus, in directed graph, degree = indegree + outdegree

numNode = size(A,1);
degree = zeros(1,numNode);

for node=1:numNode
    degree(node) = sum(A(:,node)~=0) + sum(A(node,:)~=0);
end

end

