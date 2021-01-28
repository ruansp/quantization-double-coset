%% Conceptual plot for F_{H\SO(3)}, H -> Icosahedral symmetry group
close all; clear; clc;

%% Parameters
phi = 0.5 * (1.0 + sqrt (5.0));
c = 4.0 * pi / (sqrt (250.0 + 110.0 * sqrt (5.0)) * (sqrt (5.0) - 1.0));

%% Tiles
tile = struct ('face_x', 0, 'face_y', 0, 'face_z', 0, 'face_center', 0);

tile(1).face_x = c * [0, 0, 1, phi, 1];
tile(1).face_y = c * [1/phi, -1/phi, -1, 0, 1];
tile(1).face_z = c * [phi, phi, 1, 1/phi, 1];

tile(2).face_x = c * [0, 0, -1, -phi, -1];
tile(2).face_y = c * [1/phi, -1/phi, -1, 0, 1];
tile(2).face_z = c * [phi, phi, 1, 1/phi, 1];

tile(3).face_x = c * [0, -1, -1/phi, 1/phi, 1];
tile(3).face_y = c * [-1/phi, -1, -phi, -phi, -1];
tile(3).face_z = c * [phi, 1, 0, 0, 1];

tile(4).face_x = c * [0, -1, -1/phi, 1/phi, 1];
tile(4).face_y = c * [1/phi, 1, phi, phi, 1];
tile(4).face_z = c * [phi, 1, 0, 0, 1];

tile(5).face_x = c * [1, phi, phi, 1, 1/phi];
tile(5).face_y = c * [-1, 0, 0, -1, -phi];
tile(5).face_z = c * [1, 1/phi, -1/phi, -1, 0];

tile(6).face_x = c * [-1, -phi, -phi, -1, -1/phi];
tile(6).face_y = c * [-1, 0, 0, -1, -phi];
tile(6).face_z = c * [1, 1/phi, -1/phi, -1, 0];

tile(7).face_x = c * [1, phi, phi, 1, 1/phi];
tile(7).face_y = c * [1, 0, 0, 1, phi];
tile(7).face_z = c * [1, 1/phi, -1/phi, -1, 0];

tile(8).face_x = c * [-1, -phi, -phi, -1, -1/phi];
tile(8).face_y = c * [1, 0, 0, 1, phi];
tile(8).face_z = c * [1, 1/phi, -1/phi, -1, 0];

tile(9).face_x = c * [0, 0, 1, phi, 1];
tile(9).face_y = c * [1/phi, -1/phi, -1, 0, 1];
tile(9).face_z = c * [-phi, -phi, -1, -1/phi, -1];

tile(10).face_x = c * [0, 0, -1, -phi, -1];
tile(10).face_y = c * [1/phi, -1/phi, -1, 0, 1];
tile(10).face_z = c * [-phi, -phi, -1, -1/phi, -1];

tile(11).face_x = c * [0, -1, -1/phi, 1/phi, 1];
tile(11).face_y = c * [-1/phi, -1, -phi, -phi, -1];
tile(11).face_z = c * [-phi, -1, 0, 0, -1];

tile(12).face_x = c * [0, -1, -1/phi, 1/phi, 1];
tile(12).face_y = c * [1/phi, 1, phi, phi, 1];
tile(12).face_z = c * [-phi, -1, 0, 0, -1];

%% Plots
figure; hold on;

for face_index = 1 : 12
    trisurf ([1, 2, 3, 4, 5],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);
end

plot_properties();