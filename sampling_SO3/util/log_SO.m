function x = log_SO (R)

theta = acos (0.5 * (trace (R) - 1.0));

x = zeros (3, 1);

if ( abs (theta) < 1e-15 )
    
 return;
 
elseif ( abs (theta - pi) < 1e-7 )
 
 a = 0.5 * (R(1, 1) - 1.0);
 b = 0.5 * R(2, 1);
 c = 0.5 * R(3, 1);
 d = 0.5 * (R(2, 2) - 1.0);
 e = 0.5 * R(3, 2);
 f = 0.5 * (R(3, 3) - 1.0);
 
 if ( abs (a) < 1e-15 ) % x_1 ~= 0 && x_2 == x_3 == 0
  
  x(1) = theta * sqrt (- d);
  
 elseif ( abs (d) < 1e-15 ) % x_1 == x_3 == 0 && x_2 ~= 0
  
  x(2) = theta * sqrt (- a);
  
 elseif ( abs (f) < 1e-15 ) % x_1 == x_2 == 0 && x_3 ~= 0
  
  x(3) = theta * sqrt (- a);
  
 elseif ( abs (b) < 1e-15 ) % x_1 == 0 || x_2 == 0
     
  if ( abs (c) >= 1e-15 ) % x_1, x_3 ~= 0 && x_2 == 0
   
   x(1) = sqrt (- f);
   x(3) = c / x(1);
   
   x(1) = theta * x(1);
   x(3) = theta * x(3);
   
  else % x_1 == 0 && x_2, x_3 ~= 0
   
   x(2) = sqrt (- f);
   x(3) = e / x(2);
   
   x(2) = theta * x(2);
   x(3) = theta * x(3);   
      
  end 
     
 elseif ( abs (c) < 1e-15 ) % x_1, x_2 ~= 0 && x_3 == 0
  
  x(1) = sqrt (- d);
  x(2) = b / x(1);
  
  x(1) = theta * x(1);
  x(2) = theta * x(2);
     
 else % x_1, x_2, x_3 ~= 0
     
  x(1) = theta * sign (b) * sign (e) * sqrt (b * c / e);
  x(2) = theta * sign (e) * sqrt (b * e / c);
  x(3) = theta * sqrt (c * e / b);
  
 end

else

 x = 0.5 * [R(3, 2) - R(2, 3); R(1, 3) - R(3, 1); R(2, 1) - R(1, 2)] * (theta / sin (theta));
 
end
    
end