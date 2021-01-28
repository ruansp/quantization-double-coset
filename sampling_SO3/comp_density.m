close all; clear; clc;

addpath util/
load('mat/connectivity.mat')

V_SO3 = 8*pi^2;
N = size(d_coset_HK,2);

%% Density
% double-coset
r_coset_HK = nan(1,N);
for i = 1:N
    r_coset_HK(i) = 1/2 * d_coset_HK{i}(1);
end
D_coset_HK = 4/3*pi*sum(r_coset_HK.^3) / V_SO3

% ZYZ
r_zyz = nan(1,N);
for i = 1:N
    r_zyz(i) = 1/2 * d_zyz{i}(1);
end
D_zyz = 4/3*pi*sum(r_zyz.^3) / V_SO3

% Hopf
r_hopf = nan(1,N);
for i = 1:N
    r_hopf(i) = 1/2 * d_hopf{i}(1);
end
D_hopf = 4/3*pi*sum(r_hopf.^3) / V_SO3