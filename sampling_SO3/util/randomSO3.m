function R_rand = randomSO3(num)
R_rand = nan(3,3,num);

q_exp = pi*rand(3,num);
for i = 1:num
    R_rand(:,:,i) = exp_SO(q_exp(:,i));
end
end