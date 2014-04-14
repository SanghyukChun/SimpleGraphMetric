isDirected = 0;
A = loadadj('zachary.txt', isDirected);

% isDirected = 1;
% A = loadadj('AIDSBlog.txt', isDirected);

degrees  = degree(A);
closcent = closenesscentrality(A);
betwcent = betweennesscentrality(A);
eigncent = eigenvectorcentrality(A);
cluscoef = clusteringcoefficient(A);