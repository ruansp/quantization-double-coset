close all; clear; clc;

addpath util/
N = 3600;

%% Uniform Euler angles ZYZ
disp('Uniform Euler ZYZ...')
tic;
R_zyz = nan(3,3,N);
a = linspace(-pi,pi,15);
c = linspace(-pi,pi,15);
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

R_coset = nan(3,3,N);
n = 1;
for i = 1:length(H)
    for j = 1:size(K,3)
        R_coset(:,:,n) = H(i).R * K(:,:,j);
        n = n+1;
    end
end
toc;

%% Uniformity
disp('Uniformity...')

[u_zyz, min_zyz] = consistency(R_zyz);
[u_coset, min_coset] = consistency(R_coset);
[u_hopf, min_hopf] = consistency(R_hopf);

%% Consistency
figure; hold on;
% hist(min_quat)
% hist(min_zyz)
% hist(min_coset)
% hist(min_hopf)

boxplot([min_zyz', min_hopf', min_coset'],...
    'Labels', {'Euler', 'Hopf', 'Ours'})
set(gca, 'TickLabelInterpreter', 'latex');
set(gca, 'FontSize', 15);
set(gca, 'Linewidth', 1.2);
set(gca, 'XTickLabelRotation',0)
xlabel('Methods', 'FontWeight', 'bold', 'interpreter', 'latex')
ylabel('Nearest Distance', 'FontWeight', 'bold', 'interpreter', 'latex')

std(min_zyz)
std(min_hopf)
std(min_coset)
