close all; clear; clc;

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

%% Nearest neighbors with all samples
M = length(HK);
edge = cell(1,M);
for i = 1:M
    dist = nan(1,M);
    for j = 1:M
        dist(j) = norm( log_SO(HK(i).R' * HK(j).R) );
    end
    dist(dist<=1e-10) = nan;
    
    edge{i} = find (abs(dist - min(dist)) < 0.5 );
end