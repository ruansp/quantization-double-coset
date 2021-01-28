close all; clear; clc;

addpath util/
N = 3600;

%% Uniform Euler angles ZYZ
disp('Uniform Euler ZYZ...')
tic;
R_zyz = nan(3,3,N);
a = linspace(0,2*pi,15);
c = linspace(0,2*pi,15);
b = acos(linspace(-1,1,16));
% b = linspace(0,pi,16);

idx = 1;
for i = 1:length(a)
    for j = 1:length(b)
        for k = 1:length(c)
            R_zyz(:,:,idx) = eul2rotm([a(i),b(j),c(k)], 'ZYZ');
            idx = idx+1;
        end
    end
end
toc;

%% Uniform Hopf fibration
disp('Uniform Hopf Fibration...')
R_hopf = nan(3,3,N);
load('hopf_3600.qua');

for i = 1:size(hopf_3600,1)
    R_hopf(:,:,i) = quat2rotm(hopf_3600(i,:));
end

%% Double-coset decomposition
disp('Double-coset...')
tic;
[H, wedgeTRI] = generateHTri();
g = exp_SO( [0.435897435897436; 0.076923076923077; 0.128205128205128] );
K = nan(3,3,length(H));
for i = 1:length(H)
    K(:,:,i) = g*H(i).R*g';
end

R_coset_HK = nan(3,3,N);
n = 1;
for i = 1:length(H)
    for j = 1:size(K,3)
        R_coset_HK(:,:,n) = H(i).R * K(:,:,j);
        n = n+1;
    end
end
toc;

R_coset_HH = nan(3,3,N);
n = 1;
for i = 1:length(H)
    for j = 1:length(H)
        R_coset_HH(:,:,n) = H(i).R * H(j).R;
        n = n+1;
    end
end

%% Uniformity
disp('Connectivity...')

[edge_coset_HH, n_coset_HH, d_coset_HH] = connectivity(R_coset_HH);
[edge_coset_HK, n_coset_HK, d_coset_HK] = connectivity(R_coset_HK);

[edge_zyz, n_zyz, d_zyz] = connectivity(R_zyz);
[edge_hopf, n_hopf, d_hopf] = connectivity(R_hopf);

%% Consistency
figure; hold on;
boxplot([n_coset_HH', n_coset_HK', n_zyz', n_hopf'],...
    'Labels', {'Ours, $H \backslash \textnormal{SO}(3) / H$',...
    'Ours, $H \backslash \textnormal{SO}(3) / K$', 'Euler', 'Hopf'});
set(gca, 'TickLabelInterpreter', 'latex');
set(gca, 'FontSize', 15);
set(gca, 'Linewidth', 1.2);
set(gca, 'XTickLabelRotation',30)
xlabel('Methods', 'FontWeight', 'bold', 'interpreter', 'latex')
ylabel('Number of connections', 'FontWeight', 'bold', 'interpreter', 'latex')
