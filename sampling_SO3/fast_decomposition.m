function [k, l] = fast_decomposition (R, H, wedge_TRI)
x_max = -Inf;

for h_index = 1 : 60
      
 x = sum (sum (R .* H(h_index).R));
     
 if ( x > x_max )
        
  x_max = x;
      
  k = h_index;
         
 end
 
end

l = pointLocation (wedge_TRI, log_SO (H(k).R' * R)');

end