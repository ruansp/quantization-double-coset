close all; clear; clc;

load('mat\comparison_H_K_3600_1e4_2.mat')
load('mat\uniformity_H_K_3600.mat')

yyaxis left
plot(1:3, [d_zyz, d_hopf, d_coset], 'o')
xticklabels({'Euler', 'Hopf', 'Ours'})
ylabel('Dispersion')

yyaxis right
plot(1:3, [u_zyz, u_hopf, u_coset], 'd')
ylabel('Uniformity')
