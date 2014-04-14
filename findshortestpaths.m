function [ numAllPath, numPathIncludeNode ] = findshortestpaths( node,otherNode,N,D )
% find shortest path between two vertices using Floyd-Warshall algorithm

if D(node, otherNode) == inf || node == otherNode
    paths = [];
else
    paths = cell(1,1);
    paths{1} = [node];
    QQ = [node];
    while ~any(QQ == otherNode)
        Q = QQ;
        QQ = [];
        for i=1:numel(Q)
            intermediate = Q(i);
            intermediate = N{intermediate, otherNode};
            lenInter = length(intermediate);
            if lenInter == 1
                localInter = intermediate;
                tmpP = paths{i};
                tmpP = [tmpP, localInter];
                paths{i} = tmpP;
                QQ = [QQ localInter];
            else
                pathBet = cell(lenInter,1);
                path = paths{i};
                for j=1:lenInter
                    localInter = intermediate(j);
                    pathBet{j} = [path, localInter];
                    QQ = [QQ localInter];
                end
                
                newpaths = cell(size(paths,1)+lenInter);
                for j=1:size(paths,1)+lenInter
                    if j < i
                        newpaths{j} = paths{j};
                    elseif j > i && j <= i+lenInter
                        newpaths{j} = pathBet{j-i};
                    elseif j > i+lenInter
                        newpaths{j} = paths{j-lenInter};
                    end
                end
                paths = newpaths;
            end
        end
    end
end

numAllPath = length(paths);
numPathIncludeNode = 0;
for i=1:numAllPath
    if any(paths{i} == node)
        numPathIncludeNode = numPathIncludeNode + 1;
    end
end
