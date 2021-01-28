% Naive brute-force way, go through the list
function [dist_naive, idx_naive, T_naive] = naiveCheck(R_rand, R_sample)
n = size(R_sample,3);
num = size(R_rand,3);

dist = nan(1,n);
dist_naive = nan(1,num);
idx_naive = nan(1,num);
T_naive = nan(1,num);

for i = 1:num
    ti = tic;
    for j = 1:n
        dist(j) = norm( log_SO(R_rand(:,:,i)' * R_sample(:,:,j)) );
    end
    [dist_naive(i), idx_naive(i)] = min(dist);
    T_naive(i) = toc(ti);
end
end