function plot_properties_SE2()
% Plot propoeties for F_{p_i \ SE(2)}
axis square;
grid on;
box on;

ax = gca;
ax.ZRuler.MinorTick = 'on';
ax.ZRuler.MinorTickValues = 0.5 * pi * [- 1.0, 1.0];
ax.ZRuler.MinorTickValuesMode = 'manual';
view (5, 25);

colormap summer;
set (gcf, 'color', 'w');

set (gca, 'TickLabelInterpreter', 'latex');
set (gca, 'FontSize', 30);
set (gca, 'Linewidth', 0.5);

xlabel ('$x$', 'interpreter', 'latex');
ylabel ('$y$', 'interpreter', 'latex');
zlabel ('$\theta$', 'interpreter', 'latex');
