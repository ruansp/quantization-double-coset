close all; clear; clc;

addpath util/
load('mat/connectivity.mat')

%% Uniformity
% double-coset
min_HK = min(n_coset_HK); max_HK = max(n_coset_HK);
U_coset_HK = min_HK / (1+max_HK-min_HK)
U_coset_HK_2 = min_HK / max_HK
U_coset_HK_3 = max_HK - min_HK

% ZYZ
min_zyz = min(n_zyz); max_zyz = max(n_zyz);
U_zyz = min_zyz / (1+max_zyz-min_zyz)
U_zyz_2 = min_zyz / max_zyz
U_zyz_3 = max_zyz - min_zyz

% Hopf
min_hopf = min(n_hopf); max_hopf = max(n_hopf);
U_hopf = min_hopf / (1+max_hopf-min_hopf)
U_hopf_2 = min_hopf / max_hopf
U_hopf_3 = max_hopf - min_hopf