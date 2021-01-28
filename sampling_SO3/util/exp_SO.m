function R = exp_SO (x)

R = eye (3);

if ( x(1) ~= 0.0 || x(2) ~= 0.0 || x(3) ~= 0.0 ) % TODO: Can be made even faster with cases? Probably not (it's only the axes)...
 
 x_norm_sqrd = x' * x;
 x_norm = sqrt (x_norm_sqrd);
 
 scale_1 = sin (x_norm) / x_norm; % TODO: Use Taylor expansion for small x_norm?
 
 R(3, 2) = scale_1 * x(1);
 R(1, 3) = scale_1 * x(2);
 R(2, 1) = scale_1 * x(3);
 
 R(2, 3) = - R(3, 2);
 R(3, 1) = - R(1, 3);
 R(1, 2) = - R(2, 1);
 
 x_1_x_2 = x(1) * x(2);
 x_1_x_3 = x(1) * x(3);
 x_2_x_3 = x(2) * x(3);
 
 x_1_sqrd = x(1) * x(1);
 x_2_sqrd = x(2) * x(2);
 x_3_sqrd = x(3) * x(3);
 
 x_1_sqrd_plus_x_2_sqrd = x_1_sqrd + x_2_sqrd;
 x_1_sqrd_plus_x_3_sqrd = x_1_sqrd + x_3_sqrd;
 x_2_sqrd_plus_x_3_sqrd = x_2_sqrd + x_3_sqrd;
 
 X_sqrd = [- x_2_sqrd_plus_x_3_sqrd, x_1_x_2, x_1_x_3; x_1_x_2, - x_1_sqrd_plus_x_3_sqrd, x_2_x_3; x_1_x_3, x_2_x_3, - x_1_sqrd_plus_x_2_sqrd];
 
 scale_2 = (1 - cos (x_norm)) / x_norm_sqrd; % TODO: Use Taylor expansion for small x_norm?
 
 R = R + scale_2 * X_sqrd;
    
end

end