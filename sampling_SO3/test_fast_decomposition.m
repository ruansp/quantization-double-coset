close all; clear; clc;
addpath util/

%% Double-coset decomposition
disp('Double-coset...')
[H, wedgeTRI] = generateHTri();
map = cover_map();
N = length(H);

g = exp_SO( [0.435897435897436; 0.076923076923077; 0.128205128205128] );
for i = 1:N
    K(i).R = g*H(i).R*g';
end

for i = 1:N
    for j = 1:N
        HK(60*(i-1)+j).R = H(i).R * K(j).R;
    end
end

%% Test
R_coset = nan(3,3,N);
idx_coset = nan(N^2,2);

n = 0;
for i = 1:N
    for j = 1:N
        n = n+1;
        R_coset(:,:,n) = H(i).R * K(j).R;
        
        [k,l] = fast_decomp_hk(R_coset(:,:,n), K, HK, map);
        idx_coset(n,:) = [k,l];
    end
end