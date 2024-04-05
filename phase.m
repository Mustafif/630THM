% Define parameter
alpha = 2;    % Parameter alpha

% Define dimensionless equations
du_dtau = @(u, v) u .* (1 - v);
dv_dtau = @(u, v) alpha .* v .* (u - 1);

% Define grid for plotting
u_values = linspace(0, 2, 20);
v_values = linspace(0, 2, 20);
[U, V] = meshgrid(u_values, v_values);
du_dt = du_dtau(U, V);
dv_dt = dv_dtau(U, V);

% Plot phase plane
figure;
quiver(U, V, du_dt, dv_dt, 'b', 'LineWidth', 1.5); % Increase line width for larger arrows
hold on;
plot([0 2], [0 0], 'k'); % x-axis
plot([0 0], [0 2], 'k'); % y-axis
scatter(0, 0, 200, 'ro', 'filled'); % Increase marker size for critical point (0, 0)
scatter(1, 1, 200, 'ro', 'filled'); % Increase marker size for critical point (1, 1)
xlabel('u');
ylabel('v');
title('Phase Plane: Predator-Prey Model');
axis([0 2 0 2]); % Set axis limits
grid on;
hold off;
