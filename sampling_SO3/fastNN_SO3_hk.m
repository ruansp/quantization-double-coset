function [dist_min, idx_min] = fastNN_SO3_hk(R0, list_s, R_s, K, HK, map, edge)
[k,l] = fast_decomp_hk(R0, K, HK, map);

shard_s = [];
%% The same shard
shard_s = [shard_s; find( (k == list_s(:,1)) & (l == list_s(:,2)) )];

%% The neighboring shard
idxN = 60*(k-1) + l;
for i = 1:size(edge{idxN},2)
    idxN_i = edge{idxN}(i);
    idx_k = mod( idxN_i-1, 60 )+1;
    idx_h = ( idxN_i - idx_k )/60+1;
    shard_s = [shard_s; find( (idx_h == list_s(:,1)) &...
        (idx_k == list_s(:,2)) )];
end

%% Minimum distance
dist = nan(1,length(shard_s));
for i = 1:length(shard_s)
    dist(i) = norm( log_SO( R0' * R_s(:,:,shard_s(i)) ) );
end
[dist_min, idx] = min(dist);
idx_min = shard_s(idx);
end