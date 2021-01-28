function [edge, num_connect, dist_min] = connectivity(R)
%CONNECTIVITY computes edges of sampling on SO(3) that connects nearest
%neighbors
%   Detailed explanation goes here
N = size(R,3);

%% Nearest neighbors with all samples
dist_min = cell(1,N); edge = cell(1,N);
num_connect = zeros(1,N);
parfor i = 1:N
    dist = nan(1,N);
    for j = 1:N
        dist(j) = norm( log_SO(R(:,:,i)' * R(:,:,j)) );
    end
    dist(dist<=1e-10) = nan;
    
    dist_min{i} = dist( abs(dist - min(dist)) < 1e-6 );
    edge{i} = find (abs(dist - min(dist)) < 1e-6 );
    
    num_connect(i) = size(dist_min{i},2);
end

end