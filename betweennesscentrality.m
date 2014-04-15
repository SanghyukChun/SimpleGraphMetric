function [ betwcent ] = betweennesscentrality( A )
% betweenness centrality
% get all shortest path using Floyd-Warshall algorithm (findshortestpaths)

numNode = size(A,1);
betwcent = zeros(numNode,1);
A = A > 0;

[D, N] = initfw(A);

for node=1:numNode
    for otherNode=1:numNode
        NN = N;
        DD = D;
        [ numAllPath, numPathIncludeNode ] = findshortestpaths(node,otherNode,NN,DD);
        disp([num2str(node), ' ' num2str(otherNode)]);
        if numAllPath ~= 0
            betwcent(node) = betwcent(node) + numPathIncludeNode / numAllPath;
        end
    end
end

end