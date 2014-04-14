function [ closcent ] = closenesscentrality( A )
%CLOSENESSCENTRALITY Summary of this function goes here
%   Detailed explanation goes here

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

