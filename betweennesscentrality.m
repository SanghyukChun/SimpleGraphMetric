function [ betwcent ] = betweennesscentrality( A )
%BETWEENNESSCENTRALITY Summary of this function goes here
%   Detailed explanation goes here

numNode = size(A,1);
betwcent = zeros(numNode,1);

for node=1:numNode
    for otherNode=1:numNode
        [numAllPath, numPathIncludeNode] = findshortestpathes(A,node,otherNode);
        betwcent(node) = betwcent(node) + numPathIncludeNode / numAllPath;
    end
end

end

