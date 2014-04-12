A = loadadj('zachary.txt');
% A = loadadj('AIDSBlog.txt');

degrees  = degree(A);
closcent = closenesscentrality(A);
betwcent = betweennesscentrality(A);
eigncent = eigenvectorcentrality(A);
cluscoef = clusteringcoefficient(A);