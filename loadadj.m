function [ A ] = loadadj( filename )

rawData = load(filename);
numLine = size(rawData,1);
isweighted = size(rawData,2) > 2;

tempMax = max(rawData);
numNode = max(tempMax(1:2));

A = zeros(numNode, numNode);

for iter=1:numLine
    line = rawData(iter,:);    
    i = line(1); j = line(2);
    
    if isweighted
        w = line(3);
    else
        w = 1;
    end
    
    A(i,j) = A(i,j) + w;
end

end

