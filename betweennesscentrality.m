function [ betwcent ] = betweennesscentrality( A )
%BETWEENNESSCENTRALITY Summary of this function goes here
%   Detailed explanation goes here

numNode = size(A,1);
betwcent = zeros(numNode,1);
A = A > 0;

D = inf(numNode, numNode);
N = cell(numNode, numNode);

for i=1:numNode
    D(i,i) = 0;
end

for i=1:numNode
    for j=1:numNode
        if A(i,j) ~= 0
            D(i,j) = A(i,j);
        end
    end
end

for i=1:numNode
    for j=1:numNode
        if A(i,j) ~= 0
            N{i,j} = j;
        end
    end
end

for k=1:numNode
    for i=1:numNode
        for j=1:numNode
            if D(i,k) + D(k,j) < D(i,j)
                D(i,j) = D(i,k) + D(k,j);
                N{i,j} = k;
            elseif D(i,k) + D(k,j) == D(i,j) && k~=i
                if ~any(N{i,j} == k) && D(i,j) ~= inf && D(i,j) ~= 0
                    N{i,j} = [N{i,j}, k];
                end
            end
        end
    end
end

for node=1:numNode
    for otherNode=1:numNode
        [ numAllPath, numPathIncludeNode ] = findshortestpaths(node,otherNode,N,D);
        disp([num2str(node), ' ' num2str(otherNode)]);
        if numAllPath ~= 0
            betwcent(node) = betwcent(node) + numPathIncludeNode / numAllPath;
        end
    end
end

end