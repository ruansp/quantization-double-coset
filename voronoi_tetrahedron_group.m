%% Conceptual plots for F_{H\SO(3)}, H -> Tetrahedral symmetry group
close all; clear all; clc;

%% Parameters
hc_2 = 0.5 * pi;
hc_3 = pi / 3.0;
c = - (sqrt (3.0) * hc_3 - hc_2);

%% Tiles
tile = struct ('face_x', 0, 'face_y', 0, 'face_z', 0, 'face_center', 0);

tile(1).face_x = c * [0.0, 1.0, 0.0, -1.0];
tile(1).face_y = c * [1.0, 0.0, -1.0, 0.0];
tile(1).face_z = 0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(2).face_z = c * [0.0, 1.0, 0.0, -1.0];
tile(2).face_y = c * [1.0, 0.0, -1.0, 0.0];
tile(2).face_x = 0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(3).face_z = c * [0.0, 1.0, 0.0, -1.0];
tile(3).face_y = c * [1.0, 0.0, -1.0, 0.0];
tile(3).face_x = -0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(4).face_z = c * [0.0, 1.0, 0.0, -1.0];
tile(4).face_x = c * [1.0, 0.0, -1.0, 0.0];
tile(4).face_y = 0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(5).face_z = c * [0.0, 1.0, 0.0, -1.0];
tile(5).face_x = c * [1.0, 0.0, -1.0, 0.0];
tile(5).face_y = -0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(6).face_x = c * [0.0, 1.0, 0.0, -1.0];
tile(6).face_y = c * [1.0, 0.0, -1.0, 0.0];
tile(6).face_z = -0.5 * pi * [1.0, 1.0, 1.0, 1.0];

tile(7).face_x = [tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(7).face_y = [tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(7).face_z = [tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(8).face_x = [tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(8).face_y = [tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(8).face_z = -[tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(9).face_x = -[tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(9).face_y = [tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(9).face_z = [tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(10).face_x = -[tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(10).face_y = [tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(10).face_z = -[tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(11).face_x = -[tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(11).face_y = -[tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(11).face_z = [tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(12).face_x = -[tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(12).face_y = -[tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(12).face_z = -[tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(13).face_x = [tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(13).face_y = -[tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(13).face_z = [tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

tile(14).face_x = [tile(1).face_x(3), tile(1).face_x(2), tile(3).face_x(4), tile(3).face_x(3), tile(4).face_x(1), tile(4).face_x(4)];
tile(14).face_y = -[tile(1).face_y(3), tile(1).face_y(2), tile(3).face_y(4), tile(3).face_y(3), tile(4).face_y(1), tile(4).face_y(4)];
tile(14).face_z = -[tile(1).face_z(3), tile(1).face_z(2), tile(3).face_z(4), tile(3).face_z(3), tile(4).face_z(1), tile(4).face_z(4)];

%% Plots
% figure ('units', 'normalized', 'outerposition', [0.0, 0.0, 1.0, 1.0]);
hold on;

for face_index = 1:6
    trisurf ([1, 2, 3, 4, 1],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.55, 'Linewidth', 1.3);
end

for face_index = 7:14
    trisurf ([1, 2, 3, 4, 5, 6, 1], ...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

plot_properties();