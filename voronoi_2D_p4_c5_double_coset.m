%% F_{p_4 \ SE(2) / (C_5 X {0})}
close all; clear; clc;

n = 20;
ruby = [255, 0, 0] / 255;

%% Tiles for coset p_4 \ SE(2)
tile = struct ('face_x', 0, 'face_y', 0, 'face_z', 0, 'face_center', 0);

tile(1).face_x = [2.0, 2.0, -2.0, -2.0];
tile(1).face_y = [2.0, -2.0, -2.0, 2.0];
tile(1).face_z = 0.25 * pi * ones (1, 4);

tile(2).face_x = [2.0, 2.0, -2.0, -2.0];
tile(2).face_y = [2.0, -2.0, -2.0, 2.0];
tile(2).face_z = -0.25 * pi * ones (1, 4);

tile(3).face_x = [tile(1).face_x(1), tile(1).face_x(2), tile(1).face_x(2), tile(1).face_x(1)];
tile(3).face_y = [tile(1).face_y(1), tile(1).face_y(2), tile(1).face_y(2), tile(1).face_y(1)];
tile(3).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0];

tile(4).face_x = [tile(1).face_x(2), tile(1).face_x(3), tile(1).face_x(3), tile(1).face_x(2)];
tile(4).face_y = [tile(1).face_y(2), tile(1).face_y(3), tile(1).face_y(3), tile(1).face_y(2)];
tile(4).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0];

tile(5).face_x = [tile(1).face_x(3), tile(1).face_x(4), tile(1).face_x(4), tile(1).face_x(3)];
tile(5).face_y = [tile(1).face_y(3), tile(1).face_y(4), tile(1).face_y(4), tile(1).face_y(3)];
tile(5).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0];

tile(6).face_x = [tile(1).face_x(4), tile(1).face_x(1), tile(1).face_x(1), tile(1).face_x(4)];
tile(6).face_y = [tile(1).face_y(4), tile(1).face_y(1), tile(1).face_y(1), tile(1).face_y(4)];
tile(6).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0];

%% Double-coset
[X, Y, THETA] = meshgrid (linspace(-0.5, 0.5, n), linspace(-0.5, 0.5, n), linspace(-0.25 * pi, 0.25 * pi, n));

p4_theta = pi * [0.0, 0.5, 1.0, 1.5];
C5_theta = 2.0 * pi * (0 : 4) / 5.0;

A = eye (3);
B = eye (3);
C = eye (3);

E = eye (3);

F_x = [];
F_y = [];
F_theta = [];

for x_index = 1 : n
    for y_index = 1 : n
        for theta_index = 1 : n
            
            B(1,3) = X(x_index, y_index, theta_index);
            B(2,3) = Y(x_index, y_index, theta_index);
            
            cos_theta = cos (THETA(x_index, y_index, theta_index));
            sin_theta = sin (THETA(x_index, y_index, theta_index));
            
            B(1:2,1:2) = [cos_theta, -sin_theta; sin_theta, cos_theta];
            
            dist_E_B_sqrd = d_sqrd (E, B);
            
            in_double_coset = 1;
            
            for p4_x = -10 : 10
                for p4_y = -10 : 10
                    for p4_theta_index = 1 : 4
                        
                        A(1,3) = p4_x;
                        A(2,3) = p4_y;
                        
                        cos_theta = cos (p4_theta(p4_theta_index));
                        sin_theta = sin (p4_theta(p4_theta_index));
                        
                        A(1:2,1:2) = [cos_theta, -sin_theta; sin_theta, cos_theta];
                        
                        for C5_theta_index = 1 : 5
                            
                            cos_theta = cos (C5_theta(C5_theta_index));
                            sin_theta = sin (C5_theta(C5_theta_index));
                            
                            C(1:2,1:2) = [cos_theta, -sin_theta; sin_theta, cos_theta];
                            
                            if ( (d_sqrd (E, A * B * C) < dist_E_B_sqrd) && (max (max (abs (A - E))) > 1e-10 || max (max (abs (C - E))) > 1e-10) )
                                
                                in_double_coset = 0;
                                break;
                                
                            end
                            
                        end
                        
                        if ( ~in_double_coset )
                            
                            break;
                            
                        end
                        
                    end
                    
                    if ( ~in_double_coset )
                        
                        break;
                        
                    end
                    
                end
                
                if ( ~in_double_coset )
                    
                    break;
                    
                end
                
            end
            
            if ( in_double_coset )
                
                %plot3 (4.0 * X(x_index, y_index, theta_index), 4.0 * Y(x_index, y_index, theta_index), THETA(x_index, y_index, theta_index), 'r*');
                
                F_x = [F_x; X(x_index, y_index, theta_index)];
                F_y = [F_y; Y(x_index, y_index, theta_index)];
                F_theta = [F_theta; THETA(x_index, y_index, theta_index)];
                
            end
            
        end
    end
end

F_hull = convhull (F_x, F_y, F_theta);

%% Plots
figure; hold on;

for face_index = 1 : 2
    trisurf ([1, 2, 3, 4, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, tile(face_index).face_z,...
        'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

for face_index = 3 : 6
    trisurf ([1, 2, 3, 4, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, tile(face_index).face_z,...
        'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

trisurf (F_hull, 3.99 * F_x, 3.99 * F_y, F_theta, 0.5 * pi * (F_theta - min (F_theta)) / (max (F_theta) - min (F_theta)) + 0.26 * pi,...
    'FaceAlpha', 0.6, 'Edgecolor', 'none');

xticks ([-2.0, 0.0, 2.0]);
xticklabels ({'$-\frac{1}{2}$', '0', '$\frac{1}{2}$'});

yticks ([-2.0, 0.0, 2.0]);
yticklabels ({'$-\frac{1}{2}$', '0', '$\frac{1}{2}$'});

zticks ([-pi/4, 0.0, pi/4]);
zticklabels ({'$-\frac{\pi}{4}$', '0', '$\frac{\pi}{4}$'});

plot_properties_SE2;

map = [summer(200); repmat(ruby, 200, 1)];
colormap (map);


function dist_sqrd = d_sqrd (A, B)

theta_1 = atan2 (A(2,1), A(1,1));
theta_2 = atan2 (B(2,1), B(1,1));

theta_diff = abs (theta_1 - theta_2);

dist_sqrd = (A(1,3) - B(1,3)) ^ 2 + (A(2,3) - B(2,3)) ^ 2 + (min (theta_diff, 2.0 * pi - theta_diff)) ^ 2;

end