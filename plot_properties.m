function plot_properties()
%% Plot properties
light ('Position', 10.0 * [1.0, 0.5, 1.0]);
light ('Position', 3.0 * [0.0, 0.0, 1.0]);
light ('Position', 2.0 * [1.0, 1.0, 0.5]);

%xlabel ('x', 'FontWeight', 'bold');
%ylabel ('y', 'FontWeight', 'bold');
%ZLABEL = zlabel ('z', 'FontWeight', 'bold');

axis (0.5 * pi * [-1.0, 1.0, -1.0, 1.0, -1.0, 1.0]);
axis square;
grid on;
grid minor;
box on;

xticks ([-0.5 * pi, 0.0, 0.5 * pi]);
xticklabels ({'', '0', '$\frac{\pi}{2}$'});

yticks ([-0.5 * pi, 0.0, 0.5 * pi]);
yticklabels ({'$-\frac{\pi}{2}$', '0', '$\frac{\pi}{2}$'});

zticks ([-0.5 * pi, 0.0, 0.5 * pi]);
zticklabels ({'$-\frac{\pi}{2}$', '0', '$\frac{\pi}{2}$'});

ax = gca;
ax.XRuler.MinorTick = 'on';
ax.XRuler.MinorTickValues = 0.25 * pi * [- 1.0, 1.0];
ax.XRuler.MinorTickValuesMode = 'manual';

ax.YRuler.MinorTick = 'on';
ax.YRuler.MinorTickValues = 0.25 * pi * [- 1.0, 1.0];
ax.YRuler.MinorTickValuesMode = 'manual';

ax.ZRuler.MinorTick = 'on';
ax.ZRuler.MinorTickValues = 0.25 * pi * [- 1.0, 1.0];
ax.ZRuler.MinorTickValuesMode = 'manual';

%shading flat;
%view (45, 17);
view (60, 5);

% material ([0.4, 1.0, 1.0]);
% material dull;
% material shiny;
% shading interp;
% lighting phong;

colormap summer;

%set (ZLABEL, 'Rotation', eps);
set (gcf, 'color', 'w');

set (gca, 'TickLabelInterpreter', 'latex');
set (gca, 'FontSize', 30);
set (gca, 'Linewidth', 1.2);
end