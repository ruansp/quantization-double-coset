function [dist_min, idx_min] = fastNN_SO3(R0, list_s, R_s, H, wedgeTRI, edge)
[k,l] = fast_decomposition(R0, H, wedgeTRI);

shard_s = [];
%% The same shard
shard_s = [shard_s; find( (k == list_s(:,1)) )];

%% The neighboring shard
for i = 1:size(edge{k},2)
    shard_s = [shard_s; find( (edge{k}(i) == list_s(:,1)) )];
end

%% Minimum distance
dist = nan(1,length(shard_s));
for i = 1:length(shard_s)
    dist(i) = norm( log_SO( R0' * R_s(:,:,shard_s(i)) ) );
end
[dist_min, idx] = min(dist);
idx_min = shard_s(idx);
end