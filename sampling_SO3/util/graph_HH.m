function graph = graph_HH(R, H, wedge_TRI)
%CONNECTIVITY computes edges of sampling on SO(3) that connects nearest
%neighbors
%   Detailed explanation goes here
N = size(R,3);

%% Nearest neighbors with all samples
node = nan(2,N);
edge = cell(1,N);
parfor i = 1:N
    dist = nan(1,N);
    for j = 1:N
        dist(j) = norm( log_SO(R(:,:,i)' * R(:,:,j)) );
    end
    dist(dist<=1e-10) = nan;

    [k,l] = fast_decomposition(R(:,:,i), H, wedge_TRI);
    node(:,i) = [k;l];
    
    edge{i} = find (abs(dist - min(dist)) < 1e-6 );
end
graph.edge = edge;
graph.node = node;
end