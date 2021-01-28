close all; clear; clc;

figure; hold on; axis equal;

[H, wedge_TRI, tile] = generateHTri();
for face_index = 1 : 12
    trisurf ([1, 2, 3, 4, 5],...
        tile(face_index).face_x, tile(face_index).face_y,...
        tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);
end