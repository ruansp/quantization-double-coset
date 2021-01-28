close all; clear; clc;

num = 10000;

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

R_coset = nan(3,3,N);
n = 0;
for i = 1:N
    for j = 1:N
        n = n+1;
        R_coset(:,:,n) = H(i).R * H(j).R;
    end
end

% Fast decomposition
R_rand = randomSO3(num);

dist_coset = nan(1,num); T_coset = nan(1,num);
for i = 1:num
    ti = tic;
    [k, l] = fast_decomp_hk(R_rand(:,:,i), K, HK, map);
%     [k, l] = fast_decomposition (R_rand(:,:,i), H, wedgeTRI);
    T_coset(i) = toc(ti);
end

%% Euler angle
disp('Euler angle...')
R_zyz = nan(3,3,3600);
a = linspace(-2*pi,2*pi,15);
c = linspace(-2*pi,2*pi,15);
b = linspace(-pi,pi,16);

idx = 1;
for i = 1:length(a)
    for j = 1:length(b)
        for k = 1:length(c)
            R_zyz(:,:,idx) = eul2rotm([a(i),b(j),c(k)], 'ZYZ');
            idx = idx+1;
        end
    end
end

% nearest neighbor search
R_rand = randomSO3(num);

dist_zyz = nan(1,num); T_zyz = nan(1,num);
for i = 1:num
    ti = tic;
    eulZYZ = rotm2eul(R_rand(:,:,i), 'ZYZ');
    [~,id_a] = min(abs(eulZYZ(1)-a));
    [~,id_b] = min(abs(eulZYZ(2)-b));
    [~,id_c] = min(abs(eulZYZ(3)-c));
    T_zyz(i) = toc(ti);
end


%% Time comparisons
figure; hold on;
boxplot([T_zyz(10:end)', T_coset(10:end)'],...
    'Labels', {'Euler', 'Ours'})
title('Searching time/s')

figure; hold on;
s = 10;
plot(s:num, T_zyz(s:end), s:num, T_coset(s:end))
legend({'Euler', 'Ours'})
title('Searching time/s')

mean(T_zyz)
mean(T_coset)

mean(T_coset)/mean(T_zyz)
