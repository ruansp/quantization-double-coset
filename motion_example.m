% function motion_example

clc;
close all;

tau = pi * (1.0 + (2.0) * 2.0 / 5.0)

g_tau = g (tau)

%atan2 (g_tau(2,1), g_tau(1,1))

d_sqrd_min = Inf;

for m = - 20 : 20
 for n = - 20 : 20
  for l = 0 : 3
     
   gamma = eye (3);
   
   gamma(1,3) = m;
   gamma(2,3) = n;
   
   cos_val = cos (0.5 * pi * l);
   sin_val = sin (0.5 * pi * l);
   
   gamma(1:2,1:2) = [cos_val, -sin_val; sin_val, cos_val];
      
   for j = 0 : 4
       
    delta = eye (3);
    
    cos_val = cos (2.0 * pi * j / 5.0);
    sin_val = sin (2.0 * pi * j / 5.0);
   
    delta(1:2,1:2) = [cos_val, -sin_val; sin_val, cos_val];
       
    gamma_delta = gamma * delta;
    
    d_g_tau_gamma_delta_sqrd = d_sqrd (g_tau, gamma_delta);
    
    if ( d_g_tau_gamma_delta_sqrd < d_sqrd_min )
      
     d_sqrd_min = d_g_tau_gamma_delta_sqrd;
        
     m_opt = m;
     n_opt = n;
     l_opt = l;
     j_opt = j;
     
     gamma_delta_opt = gamma_delta;
        
    end   
       
   end
      
  end
 end
end

gamma_delta_opt

%atan2 (gamma_delta_opt(2,1), gamma_delta_opt(1,1))

l_opt
m_opt
n_opt
j_opt

% end

% -------------------------------------------------------------------------

function dist_sqrd = d_sqrd (A, B)

theta_1 = atan2 (A(2,1), A(1,1));
theta_2 = atan2 (B(2,1), B(1,1));

theta_diff = abs (theta_1 - theta_2);

dist_sqrd = (A(1,3) - B(1,3)) ^ 2 + (A(2,3) - B(2,3)) ^ 2 + (min (theta_diff, 2.0 * pi - theta_diff)) ^ 2;

end

function g_tau = g (tau)

g_tau = eye (3);

cos_tau = cos (tau);
sin_tau = sin (tau);

g_tau(1,3) = 4.0 * cos_tau;
g_tau(2,3) = 6.0 * tau / (2.0 * pi) - 3.0;

g_tau(1:2,1:2) = [cos_tau, -sin_tau; sin_tau, cos_tau];

end