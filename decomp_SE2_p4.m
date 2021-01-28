% SE(2) decomposition, p4 \ SE(2)
figure; hold on;

for row = -1 : 1
for col = -1 : 1
for stack = -2 : 2

tile(1).face_x = [2.0, 2.0, -2.0, -2.0] + 4 * row;
tile(1).face_y = [2.0, -2.0, -2.0, 2.0] + 4 * col;
tile(1).face_z = 0.25 * pi * ones (1, 4) + stack * 0.5 * pi;

tile(2).face_x = [2.0, 2.0, -2.0, -2.0] + 4 * row;
tile(2).face_y = [2.0, -2.0, -2.0, 2.0] + 4 * col;
tile(2).face_z = -0.25 * pi * ones (1, 4) + stack * 0.5 * pi;

tile(3).face_x = [tile(1).face_x(1), tile(1).face_x(2), tile(1).face_x(2), tile(1).face_x(1)];
tile(3).face_y = [tile(1).face_y(1), tile(1).face_y(2), tile(1).face_y(2), tile(1).face_y(1)];
tile(3).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0] + stack * 0.5 * pi;

tile(4).face_x = [tile(1).face_x(2), tile(1).face_x(3), tile(1).face_x(3), tile(1).face_x(2)];
tile(4).face_y = [tile(1).face_y(2), tile(1).face_y(3), tile(1).face_y(3), tile(1).face_y(2)];
tile(4).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0] + stack * 0.5 * pi;

tile(5).face_x = [tile(1).face_x(3), tile(1).face_x(4), tile(1).face_x(4), tile(1).face_x(3)];
tile(5).face_y = [tile(1).face_y(3), tile(1).face_y(4), tile(1).face_y(4), tile(1).face_y(3)];
tile(5).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0] + stack * 0.5 * pi;

tile(6).face_x = [tile(1).face_x(4), tile(1).face_x(1), tile(1).face_x(1), tile(1).face_x(4)];
tile(6).face_y = [tile(1).face_y(4), tile(1).face_y(1), tile(1).face_y(1), tile(1).face_y(4)];
tile(6).face_z = 0.25 * pi * [1.0, 1.0, -1.0, -1.0] + stack * 0.5 * pi;

for face_index = 1 : 2
    
 trisurf ([1, 2, 3, 4, 1], tile(face_index).face_x, tile(face_index).face_y, tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);

end

for face_index = 3 : 6
    
 trisurf ([1, 2, 3, 4, 1], tile(face_index).face_x, tile(face_index).face_y, tile(face_index).face_z, 'FaceAlpha', 0.65, 'Linewidth', 1.3);

end

end
end
end


xticks ([-8.0, -4.0, 0.0, 4.0, 8.0]);
xticklabels ({'$-2$', '$-1$', '0', '$1$', '$2$'});

yticks ([-8.0, -4.0, 0.0, 4.0, 8.0]);
yticklabels ({'$-2$', '$-1$', '0', '$1$', '$2$'});

zticks ([-pi, 0.0, pi]);
zticklabels ({'$-\pi$', '0', '$\pi$'});

grid on;
box on;

ax = gca;
ax.ZRuler.MinorTick = 'on';
ax.ZRuler.MinorTickValues = 0.5 * pi * [- 1.0, 1.0];
ax.ZRuler.MinorTickValuesMode = 'manual';
view (45, 25);

colormap summer;
set (gcf, 'color', 'w');

set (gca, 'TickLabelInterpreter', 'latex');
set (gca, 'FontSize', 25);
set (gca, 'Linewidth', 0.5);

xlabel ('$x$', 'interpreter', 'latex');
ylabel ('$y$', 'interpreter', 'latex');
zlabel ('$\theta$', 'interpreter', 'latex');