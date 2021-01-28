function voronoi_ico_wedge_double_coset

ruby = [255, 0, 0] / 255;
% -------------------------------------------------------------------------

phi = 0.5 * (1.0 + sqrt (5.0));
c = 4.0 * pi / (sqrt (250.0 + 110.0 * sqrt (5.0)) * (sqrt (5.0) - 1.0));

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

for face_index = 1 : 12

 tile(face_index).face_center = [mean(tile(face_index).face_x), mean(tile(face_index).face_y), mean(tile(face_index).face_z)];
 
end

figure; hold on;

for face_index = 1 : 12
    
 if ( face_index == 3 )
     
  trisurf ([1, 2, 3, 4, 5, 6], [tile(face_index).face_x(1), tile(face_index).face_center(1), tile(face_index).face_x(2 : end)], [tile(face_index).face_y(1), tile(face_index).face_center(2), tile(face_index).face_y(2 : end)], [tile(face_index).face_z(1), tile(face_index).face_center(3), tile(face_index).face_z(2 : end)], 'FaceAlpha', 0.5, 'Linewidth', 1.3);
     
 else
     
  trisurf ([1, 2, 3, 4, 5], tile(face_index).face_x, tile(face_index).face_y, tile(face_index).face_z, 'FaceAlpha', 0.5, 'Linewidth', 1.3);

 end
  
end

wedge_vert_x = [0.0, tile(1).face_x, tile(1).face_center(1)];
wedge_vert_y = [0.0, tile(1).face_y, tile(1).face_center(2)];
wedge_vert_z = [0.0, tile(1).face_z, tile(1).face_center(3)];

wedge_tri = [1, 2, 3, 7; 1, 3, 4, 7; 1, 4, 5, 7; 1, 5, 6, 7; 1, 6, 2, 7];

wedge_vert_x = [wedge_vert_x, tile(2).face_x(3 : end), tile(2).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(2).face_y(3 : end), tile(2).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(2).face_z(3 : end), tile(2).face_center(3)];

wedge_tri = [wedge_tri; 1, 3, 2, 11; 1, 2, 10, 11; 1, 10, 9, 11; 1, 9, 8, 11; 1, 8, 3, 11];

wedge_vert_x = [wedge_vert_x, tile(3).face_x([3, 4]), tile(3).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(3).face_y([3, 4]), tile(3).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(3).face_z([3, 4]), tile(3).face_center(3)];

wedge_tri = [wedge_tri; 1, 3, 8, 14; 1, 8, 12, 14; 1, 12, 13, 14; 1, 13, 4, 14; 1, 4, 3, 14];

wedge_vert_x = [wedge_vert_x, tile(4).face_x([3, 4]), tile(4).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(4).face_y([3, 4]), tile(4).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(4).face_z([3, 4]), tile(4).face_center(3)];

wedge_tri = [wedge_tri; 1, 2, 6, 17; 1, 6, 16, 17; 1, 16, 15, 17; 1, 15, 10, 17; 1, 10, 2, 17];

wedge_vert_x = [wedge_vert_x, tile(5).face_x([3, 4]), tile(5).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(5).face_y([3, 4]), tile(5).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(5).face_z([3, 4]), tile(5).face_center(3)];

wedge_tri = [wedge_tri; 1, 4, 13, 20; 1, 13, 19, 20; 1, 19, 18, 20; 1, 18, 5, 20; 1, 5, 4, 20];

wedge_vert_x = [wedge_vert_x, tile(6).face_x([3, 4]), tile(6).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(6).face_y([3, 4]), tile(6).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(6).face_z([3, 4]), tile(6).face_center(3)];

wedge_tri = [wedge_tri; 1, 8, 9, 23; 1, 9, 21, 23; 1, 21, 22, 23; 1, 22, 12, 23; 1, 12, 8, 23];

wedge_vert_x = [wedge_vert_x, tile(7).face_x(4), tile(7).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(7).face_y(4), tile(7).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(7).face_z(4), tile(7).face_center(3)];

wedge_tri = [wedge_tri; 1, 6, 5, 25; 1, 5, 18, 25; 1, 18, 24, 25; 1, 24, 16, 25; 1, 16, 6, 25];

wedge_vert_x = [wedge_vert_x, tile(8).face_x(4), tile(8).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(8).face_y(4), tile(8).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(8).face_z(4), tile(8).face_center(3)];

wedge_tri = [wedge_tri; 1, 10, 15, 27; 1, 15, 26, 27; 1, 26, 21, 27; 1, 21, 9, 27; 1, 9, 10, 27];

wedge_vert_x = [wedge_vert_x, tile(9).face_x([1, 2]), tile(9).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(9).face_y([1, 2]), tile(9).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(9).face_z([1, 2]), tile(9).face_center(3)];

wedge_tri = [wedge_tri; 1, 13, 12, 32; 1, 12, 22, 32; 1, 22, 29, 32; 1, 29, 19, 32; 1, 19, 13, 32];

wedge_vert_x = [wedge_vert_x, tile(10).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(10).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(10).face_center(3)];

wedge_tri = [wedge_tri; 1, 15, 16, 33; 1, 16, 24, 33; 1, 24, 28, 33; 1, 28, 26, 33; 1, 26, 15, 33];

wedge_vert_x = [wedge_vert_x, tile(11).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(11).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(11).face_center(3)];

wedge_tri = [wedge_tri; 1, 18, 19, 30; 1, 19, 29, 30; 1, 29, 28, 30; 1, 28, 24, 30; 1, 24, 18, 30];

wedge_vert_x = [wedge_vert_x, tile(12).face_center(1)];
wedge_vert_y = [wedge_vert_y, tile(12).face_center(2)];
wedge_vert_z = [wedge_vert_z, tile(12).face_center(3)];

wedge_tri = [wedge_tri; 1, 21, 26, 31; 1, 26, 28, 31; 1, 28, 29, 31; 1, 29, 22, 31; 1, 22, 21, 31];

wedge = struct ('x', 0, 'y', 0, 'z', 0);
wedge_counter = 1;

for face_index = 3 : 3
    
 wedge(wedge_counter).x = [tile(face_index).face_x(1), tile(face_index).face_x(2), tile(face_index).face_center(1), 0.0];
 wedge(wedge_counter).y = [tile(face_index).face_y(1), tile(face_index).face_y(2), tile(face_index).face_center(2), 0.0];
 wedge(wedge_counter).z = [tile(face_index).face_z(1), tile(face_index).face_z(2), tile(face_index).face_center(3), 0.0];
 
 trisurf ([1, 2, 3], wedge(wedge_counter).x, wedge(wedge_counter).y, wedge(wedge_counter).z, wedge(wedge_counter).z + 0.5 * pi, 'FaceAlpha', 1.0, 'Linewidth', 1.3);
 trisurf ([1, 2, 4], wedge(wedge_counter).x, wedge(wedge_counter).y, wedge(wedge_counter).z, wedge(wedge_counter).z + 0.5 * pi, 'FaceAlpha', 1.0, 'Linewidth', 1.3);
 trisurf ([1, 3, 4], wedge(wedge_counter).x, wedge(wedge_counter).y, wedge(wedge_counter).z, wedge(wedge_counter).z + 0.5 * pi, 'FaceAlpha', 1.0, 'Linewidth', 1.3);
 trisurf ([2, 3, 4], wedge(wedge_counter).x, wedge(wedge_counter).y, wedge(wedge_counter).z, wedge(wedge_counter).z + 0.5 * pi, 'FaceAlpha', 1.0, 'Linewidth', 1.3);
    
end

hold off;

light ('Position', 10.0 * [1.0, 0.5, 1.0]);
light ('Position', 3.0 * [0.0, 0.0, 1.0]);
light ('Position', 2.0 * [1.0, 1.0, 0.5]);

%xlabel ('x', 'FontWeight', 'bold');
%ylabel ('y', 'FontWeight', 'bold');
%ZLABEL = zlabel ('z', 'FontWeight', 'bold');

axis (0.25 * pi * [-1.0, 1.0, -1.0, 1.0, -1.0, 1.0]);
axis square;
grid on;
grid minor;
box on;

xticks ([-0.25 * pi, 0.0, 0.25 * pi]);
xticklabels ({'', '0', '$\frac{\pi}{4}$'});

yticks ([-0.25 * pi, 0.0, 0.25 * pi]);
yticklabels ({'$-\frac{\pi}{4}$', '0', '$\frac{\pi}{4}$'});

zticks ([-0.25 * pi, 0.0, 0.25 * pi]);
zticklabels ({'$-\frac{\pi}{4}$', '0', '$\frac{\pi}{4}$'});

ax = gca;
ax.XRuler.MinorTick = 'on';
ax.XRuler.MinorTickValues = 0.125 * pi * [- 1.0, 1.0];
ax.XRuler.MinorTickValuesMode = 'manual';

ax.YRuler.MinorTick = 'on';
ax.YRuler.MinorTickValues = 0.125 * pi * [- 1.0, 1.0];
ax.YRuler.MinorTickValuesMode = 'manual';

ax.ZRuler.MinorTick = 'on';
ax.ZRuler.MinorTickValues = 0.125 * pi * [- 1.0, 1.0];
ax.ZRuler.MinorTickValuesMode = 'manual';

%shading flat;
view (60, 25);

%material ([0.4, 1.0, 1.0]);
%material dull;
%material shiny;
%shading interp;
%lighting phong;

%set (ZLABEL, 'Rotation', eps);
set (gcf, 'color', 'w');

set (gca, 'TickLabelInterpreter', 'latex');
set (gca, 'FontSize', 30);
set (gca, 'Linewidth', 1.2);

map = [summer(200); repmat(ruby, 200, 1)];

colormap (map);

end