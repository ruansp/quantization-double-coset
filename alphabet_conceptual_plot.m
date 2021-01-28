%% Conceptual plot for alphabet and round-off for continuous Euclidean motions
close all; clear; clc;
fontsize = 20;

%% Voronoi cell centers
x = [0.7040,0.7296,0.9669,0.7577,0.5579,0.6465,0.3108,0.4548,0.2090,0.2488,0.9613,0.9162,0.0825,0.0867,0.6413,0.8068,0.8992,0.4367,0.8697,0.5085];
y = [0.7215,0.3655,0.9666,0.4842,0.1556,0.2349,0.2319,0.9163,0.6775,0.1221,0.3231,0.4696,0.1993,0.7194,0.0212,0.2379,0.0523,0.6659,0.7073,0.0453];

%% Plots
figure; 
hold on; 
axis off; 
grid off;

voronoi (x, y, 'k');

t = linspace(0, pi, 100);
g_x = 0.25 * t + 0.127;
g_y = 0.35 * sin(t + 0.465) + 0.292;

idx_sample = 3:15:length(t);

for i = idx_sample
    d_sqrd_min = Inf;
    cell_opt = 0;
    
    for cell = 1:length(x)
        d_sqrd = (x(cell) - g_x(i)) ^ 2 + (y(cell) - g_y(i)) ^ 2;
        
        if ( d_sqrd < d_sqrd_min )
            d_sqrd_min = d_sqrd;
            cell_opt = cell;
        end
    end
    
    plot([g_x(i), x(cell_opt)], [g_y(i), y(cell_opt)], 'm--');
end

%% Plot curves
plot (x, y, 'k.', 'MarkerSize', 15)
plot (g_x, g_y, 'r-');
plot (g_x(idx_sample), g_y(idx_sample), 'r.', 'MarkerSize', 15);

%% Add texts
% Cell centers
text(x(1), y(1), '$\gamma_1 \delta_1$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(2), y(2), '$\gamma_1 \delta_2$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(3), y(3), '$\gamma_1 \delta_3$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(4), y(4), '$\gamma_1 \delta_4$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(5), y(5), '$\gamma_2 \delta_1$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(6), y(6), '$\gamma_2 \delta_2$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(7), y(7), '$\gamma_2 \delta_3$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(8), y(8), '$\gamma_2 \delta_4$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(9), y(9), '$\gamma_3 \delta_1$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(10), y(10), '$\gamma_3 \delta_2$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(11), y(11), '$\gamma_3 \delta_3$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(12), y(12), '$\gamma_3 \delta_4$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(13), y(13), '$\gamma_4 \delta_1$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(14), y(14), '$\gamma_4 \delta_2$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(15), y(15), '$\gamma_4 \delta_3$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(16), y(16), '$\gamma_4 \delta_4$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(17), y(17), '$\gamma_5 \delta_1$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(18), y(18), '$\gamma_5 \delta_2$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(19), y(19), '$\gamma_5 \delta_3$', 'Interpreter', 'latex', 'fontsize', fontsize)
text(x(20), y(20), '$\gamma_5 \delta_4$', 'Interpreter', 'latex', 'fontsize', fontsize)

% Via points on curve
text(g_x(idx_sample(1)), g_y(idx_sample(1)), '$g(\tau_1)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(2)), g_y(idx_sample(2)), '$g(\tau_2)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(3)), g_y(idx_sample(3)), '$g(\tau_3)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(4)), g_y(idx_sample(4)), '$g(\tau_4)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(5)), g_y(idx_sample(5)), '$g(\tau_5)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(6)), g_y(idx_sample(6)), '$g(\tau_6)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')
text(g_x(idx_sample(7)), g_y(idx_sample(7)), '$g(\tau_7)$', 'Interpreter', 'latex', 'fontsize', fontsize, 'Color', 'r')