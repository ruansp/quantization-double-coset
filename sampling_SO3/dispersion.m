function [d, dist_min] = dispersion(R, num)
%DISPERSION computes the dispersion of sampling on SO(3)
%   Detailed explanation goes here

if nargin < 2
    num = 1e4;
end
N = size(R,3);

dist_min = nan(1,num);
parfor i = 1:num
    %% Random rotation on SO(3)
    q_exp = pi*rand(3,1);
    R_rand = exp_SO(q_exp);
    
    %% Nearest neighbor with all samples
    dist = nan(1,N);
    for j = 1:N
        dist(j) = norm( log_SO(R_rand' * R(:,:,j)) );
    end
    dist_min(i) = min(dist);
end

%% Dispersion
d = max(dist_min);

end

% function R = SO3_exp(q)
% q_hat = skew(q);
% R = eye(3) + sin(norm(q))/norm(q) * q_hat +...
%     (1-cos(norm(q)))/norm(q)^2 * q_hat^2;
% end
% 
% function q = SO3_log(R)
% th = acos( (trace(R)-1)/2 );
% q = 1/2 * th/sin(th) * (R-R');
% end