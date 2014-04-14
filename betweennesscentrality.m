function [ betwcent ] = betweennesscentrality( A )
%BETWEENNESSCENTRALITY Summary of this function goes here
%   Detailed explanation goes here

numNode = size(A,1);
betwcent = zeros(numNode,1);
A = A > 0;

for node=1:numNode
    for otherNode=1:numNode
        [ numAllPath, numPathIncludeNode ] = findshortestpaths(A,node,otherNode);
        if numAllPath ~= 0
            betwcent(node) = betwcent(node) + numPathIncludeNode / numAllPath;
        end
    end
end

end