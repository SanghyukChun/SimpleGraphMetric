function [ closcent ] = closenesscentrality( A )
% closeness centrality. compute shortest path length using
% graphshortestpath algorithm (using dijkstra)

numNode = size(A,1);
closcent = zeros(numNode,1);
A = A > 0;
sparseA = sparse(A);

for node=1:numNode
    distSum = 0;
    
    for otherNode=1:numNode
        dist = graphshortestpath(sparseA, node, otherNode);
        distSum = distSum + dist;
    end
    
    closcent(node) = 1 / numNode / distSum;
end

end

