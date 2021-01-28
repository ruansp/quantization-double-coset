close all; clear; clc;
addpath util/

%% Edge connectivity SO(3) double-coset decomposition, H\SO(3)/H
load('mat/graph_HK_05.mat')

%% load the rotation samples from Hopf fibration
q_s = load('hopf_1e4.qua');
N = size(q_s,1);

% List of the shard containing each sample
list_s = nan(N,2);
for i = 1:N
    R_s(:,:,i) = quat2rotm(q_s(i,:));
    [k,l] = fast_decomp_hk(R_s(:,:,i), K, HK, map);
    list_s(i,:) = [k,l];
end

%% Random rotation and localize to a shard
num = 100;
R_rand = randomSO3(num);

disp('Fast checking...')
for i = 1:num
    ti = tic;
    [dist_fast(i), idx_fast(i)] = fastNN_SO3_hk(R_rand(:,:,i),...
        list_s, R_s, K, HK, map, edge);
    T_fast(i) = toc(ti);
end

disp('Brute-force...')
[dist_naive, idx_naive, T_naive] = naiveCheck(R_rand, R_s);

%% plots
figure;
plot(1:num, dist_naive, 'o-', 1:num, dist_fast, 'x-',...
    'LineWidth', 2)
legend({'Brute-force', 'Ours'}, 'Interpreter', 'latex')
xlabel('Index of the queried rotation', 'Interpreter', 'latex')
ylabel('Distance metric', 'Interpreter', 'latex')
% title('Distance metric for double-coset decomposition')
set(gca, 'FontSize', 15)
set(gca, 'TickLabelInterpreter', 'latex')

figure;
boxplot([T_naive', T_fast'], 'Labels', {'Brute-force', 'Ours'})
mean(T_naive)/mean(T_fast)