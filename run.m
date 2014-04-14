isDirected = 0;
A = loadadj('zachary.txt', isDirected);

% isDirected = 1;
% A = loadadj('AIDSBlog.txt', isDirected);

degrees  = degree(A);
closcent = closenesscentrality(A);
betwcent = betweennesscentrality(A);
eigncent = eigenvectorcentrality(A);
cluscoef = clusteringcoefficient(A);

numNode = size(A,1);
txt = sprintf('#    degree  closeness  betweeness  eigenvector  cluster_coefficeint');
disp(txt);
for i=1:numNode
    txt = sprintf('%02d :    %02d    %04f   %04f   %04f    %04f',i,degrees(i),closcent(i),betwcent(i),eigncent(i),cluscoef(i));
    disp(txt);
end