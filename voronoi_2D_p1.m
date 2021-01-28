%% F_{p_1 \ SE(2)}
close all; clear; clc;

%% Tiles
tile = struct ('face_x', 0, 'face_y', 0, 'face_z', 0, 'face_center', 0);

tile(1).face_x = [0.8284, -0.8284, -2.0, -0.8284, 0.8284, 2.0];
tile(1).face_y = [-2.0, -2.0, -0.8284, 2.0, 2.0, 0.8284];
tile(1).face_z = pi * ones (1, 6);

tile(2).face_x = [0.8284, -0.8284, -2.0, -0.8284, 0.8284, 2.0];
tile(2).face_y = [-2.0, -2.0, -0.8284, 2.0, 2.0, 0.8284];
tile(2).face_z = -pi * ones (1, 6);

tile(3).face_x = [tile(1).face_x(1), tile(1).face_x(2), tile(1).face_x(2), tile(1).face_x(1)];
tile(3).face_y = [tile(1).face_y(1), tile(1).face_y(2), tile(1).face_y(2), tile(1).face_y(1)];
tile(3).face_z = pi * [1.0, 1.0, -1.0, -1.0];

tile(4).face_x = [tile(1).face_x(2), tile(1).face_x(3), tile(1).face_x(3), tile(1).face_x(2)];
tile(4).face_y = [tile(1).face_y(2), tile(1).face_y(3), tile(1).face_y(3), tile(1).face_y(2)];
tile(4).face_z = pi * [1.0, 1.0, -1.0, -1.0];

tile(5).face_x = [tile(1).face_x(3), tile(1).face_x(4), tile(1).face_x(4), tile(1).face_x(3)];
tile(5).face_y = [tile(1).face_y(3), tile(1).face_y(4), tile(1).face_y(4), tile(1).face_y(3)];
tile(5).face_z = pi * [1.0, 1.0, -1.0, -1.0];

tile(6).face_x = [tile(1).face_x(4), tile(1).face_x(5), tile(1).face_x(5), tile(1).face_x(4)];
tile(6).face_y = [tile(1).face_y(4), tile(1).face_y(5), tile(1).face_y(5), tile(1).face_y(4)];
tile(6).face_z = pi * [1.0, 1.0, -1.0, -1.0];

tile(7).face_x = [tile(1).face_x(5), tile(1).face_x(6), tile(1).face_x(6), tile(1).face_x(5)];
tile(7).face_y = [tile(1).face_y(5), tile(1).face_y(6), tile(1).face_y(6), tile(1).face_y(5)];
tile(7).face_z = pi * [1.0, 1.0, -1.0, -1.0];

tile(8).face_x = [tile(1).face_x(6), tile(1).face_x(1), tile(1).face_x(1), tile(1).face_x(6)];
tile(8).face_y = [tile(1).face_y(6), tile(1).face_y(1), tile(1).face_y(1), tile(1).face_y(6)];
tile(8).face_z = pi * [1.0, 1.0, -1.0, -1.0];

%% Plots
figure; hold on;

for face_index = 1 : 2
    trisurf ([1, 2, 3, 4, 5, 6, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

for face_index = 3 : 8
    trisurf ([1, 2, 3, 4, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

xticks ([-2.0, 0.0, 2.0]);
xticklabels ({'$-\frac{1}{2}$', '0', '$\frac{1}{2}$'});

yticks ([-2.0, 0.0, 2.0]);
yticklabels ({'$-\frac{1}{2}$', '0', '$\frac{1}{2}$'});

zticks ([-pi, 0.0, pi]);
zticklabels ({'$-\pi$', '0', '$\pi$'});

plot_properties_SE2;