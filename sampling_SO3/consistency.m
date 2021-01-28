function [d, dist_min] = consistency(R)
%UNIFORMITY computes the consistency of sampling on SO(3)
%   Detailed explanation goes here
N = size(R,3);

%% Nearest neighbor with all samples
dist_min = nan(1,N);
parfor i = 1:N
    dist = nan(1,N);
    for j = 1:N
        dist(j) = norm( log_SO(R(:,:,i)' * R(:,:,j)) );
    end
    dist(dist<1e-10) = nan;
    dist_min(i) = min(dist);
end

%% Uniformity
d = std(dist_min);

end