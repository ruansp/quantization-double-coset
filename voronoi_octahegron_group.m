%% Conceptual plot for F_{H\SO(3)}, H -> Octahedral symmetry group
close all; clear; clc;

%% Parameters
hc_3 = pi / 3.0;
hc_4 = 0.25 * pi;

%t = 0.75 * pi - sqrt (3.0) * hc_3;
t = 0.32;

%% Tiles
tile = struct ('face_x', 0, 'face_y', 0, 'face_z', 0, 'face_center', 0);

tile(1).face_x = hc_4 * [t, 1.0, 1.0];
tile(1).face_y = hc_4 * [1.0, t, 1.0];
tile(1).face_z = hc_4 * [1.0, 1.0, t];

tile(2).face_x = -hc_4 * [t, 1.0, 1.0];
tile(2).face_y = hc_4 * [1.0, t, 1.0];
tile(2).face_z = hc_4 * [1.0, 1.0, t];

tile(3).face_x = hc_4 * [t, 1.0, 1.0];
tile(3).face_y = -hc_4 * [1.0, t, 1.0];
tile(3).face_z = hc_4 * [1.0, 1.0, t];

tile(4).face_x = -hc_4 * [t, 1.0, 1.0];
tile(4).face_y = -hc_4 * [1.0, t, 1.0];
tile(4).face_z = hc_4 * [1.0, 1.0, t];

tile(5).face_x = hc_4 * [t, 1.0, 1.0];
tile(5).face_y = hc_4 * [1.0, t, 1.0];
tile(5).face_z = -hc_4 * [1.0, 1.0, t];

tile(6).face_x = -hc_4 * [t, 1.0, 1.0];
tile(6).face_y = hc_4 * [1.0, t, 1.0];
tile(6).face_z = -hc_4 * [1.0, 1.0, t];

tile(7).face_x = hc_4 * [t, 1.0, 1.0];
tile(7).face_y = -hc_4 * [1.0, t, 1.0];
tile(7).face_z = -hc_4 * [1.0, 1.0, t];

tile(8).face_x = -hc_4 * [t, 1.0, 1.0];
tile(8).face_y = -hc_4 * [1.0, t, 1.0];
tile(8).face_z = -hc_4 * [1.0, 1.0, t];

tile(9).face_x = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(9).face_y = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(9).face_z = [tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

tile(10).face_x = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(10).face_y = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(10).face_z = -[tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

tile(11).face_z = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(11).face_y = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(11).face_x = [tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

tile(12).face_z = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(12).face_y = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(12).face_x = -[tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

tile(13).face_z = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(13).face_x = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(13).face_y = [tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

tile(14).face_z = [tile(1).face_x(2), tile(1).face_x(1), tile(2).face_x(1), tile(2).face_x(2), tile(4).face_x(2), tile(4).face_x(1), tile(3).face_x(1), tile(3).face_x(2)];
tile(14).face_x = [tile(1).face_y(2), tile(1).face_y(1), tile(2).face_y(1), tile(2).face_y(2), tile(4).face_y(2), tile(4).face_y(1), tile(3).face_y(1), tile(3).face_y(2)];
tile(14).face_y = -[tile(1).face_z(2), tile(1).face_z(1), tile(2).face_z(1), tile(2).face_z(2), tile(4).face_z(2), tile(4).face_z(1), tile(3).face_z(1), tile(3).face_z(2)];

%% Plots
figure; hold on;

for face_index = 1 : 8
    trisurf ([1, 2, 3, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.5, 'Linewidth', 1.3);
end

for face_index = 9 : 14
    trisurf ([1, 2, 3, 4, 5, 6, 7, 8, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.5, 'Linewidth', 1.3);
end

plot_properties();