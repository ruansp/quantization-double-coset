function [h, k] = fast_decomp_hk(R, K, HK, map)
%% K index
x_max = -inf;
for k_index = 1:60
    x = sum (sum (R .* K(k_index).R));
    
    if x > x_max
        x_max = x;
        k_pre = k_index;
    end
end

%% H index
x_max = -inf;
for idx = 1:size(map,2)
    x = sum( sum( R .* HK( map(k_pre,idx) ).R ) );
    
    if x > x_max
        x_max = x;
        hk_idx = map(k_pre,idx);
    end
end

%% Recover index
k = mod(hk_idx-1, 60) + 1;
h = (hk_idx - k)/60 + 1;

end


