clear;
clc;
close all;

% FRACTAL 1: FERN
N = 500000;

x = zeros(1, N + 1);
y = zeros(1, N + 1);

for n = 1:N
    r = rand();

    if r <= 0.01
        x(n+1) = 0;
        y(n+1) = 0.16 * y(n);

    elseif r <= 0.08
        x(n+1) = 0.2*x(n) - 0.26*y(n);
        y(n+1) = 0.23*x(n) + 0.22*y(n) + 1.6;

    elseif r <= 0.15
        x(n+1) = -0.15*x(n) + 0.28*y(n);
        y(n+1) = 0.26*x(n) + 0.24*y(n) + 0.44;

    else
        x(n+1) = 0.85*x(n) + 0.04*y(n);
        y(n+1) = -0.04*x(n) + 0.85*y(n) + 1.6;
    end
end

figure(1);
plot(x, y, '.', 'Color', [0 0.5 0], 'MarkerSize', 1);
axis equal;
grid on;
title('1. Barnsley Fern');
xlabel('X');
ylabel('Y');


% FRACTAL 2: SIERPINSKI TRIANGLE

axiom = 'F+F+F';
ruleF = 'F+F-F-F+F';
ruleG = '';
iterations = 5;
angleDeg = 120;

draw_lsystem(axiom, ruleF, ruleG, ...
             iterations, angleDeg, 2, ...
             '2. Sierpinski Triangle');


% FRACTAL 3: ORNAMENT

axiom = 'F';
ruleF = '+F--F+';
ruleG = '';
iterations = 10;
angleDeg = 45;

draw_lsystem(axiom, ruleF, ruleG, ...
             iterations, angleDeg, 3, ...
             '3. Fractal Ornament');


% FRACTAL 4: GRASS

axiom = 'G';
ruleF = 'FF';
ruleG = 'F[+G]F[-G]+G';
iterations = 6;
angleDeg = 22.5;

draw_lsystem(axiom, ruleF, ruleG, ...
             iterations, angleDeg, 4, ...
             '4. Fractal Grass');


% FRACTAL 5: FRACTAL TREE

axiom = 'G';
ruleF = 'FF';
ruleG = 'F[+G][-G]F[+G][-G]FG';
iterations = 6;
angleDeg = 25;

draw_lsystem(axiom, ruleF, ruleG, ...
             iterations, angleDeg, 5, ...
             '5. Fractal Tree');


% FRACTAL 6: MANDELBROT SET

resolution = 700;
maxIter = 100;

Cx = linspace(-1.4, 0.5, resolution);
Cy = linspace(-1, 1, resolution);

[XX, YY] = meshgrid(Cx, Cy);

C = XX + 1i * YY;
Z = zeros(size(C));

iterations = zeros(size(C));
active = true(size(C));

for k = 1:maxIter
    Z(active) = Z(active).^2 + C(active);
    iterations(active) = k;
    active = active & (abs(Z) <= 2);
end

figure(6);
imagesc(Cx, Cy, iterations);
axis xy;
axis equal tight;
colormap(jet(256));
colorbar;
title('6. Mandelbrot Set');
xlabel('Real axis');
ylabel('Imaginary axis');


% FRACTAL 7: L-MODEL

draw_lsystem('F', 'F-F-FF+F-F-F', '', ...
             4, 90, 7, '7. L-Model');

% FRACTAL 8: PATTERN

draw_lsystem('F', 'F+F-F--F+F+F', '', ...
             5, 72, 8, '8. Fractal Pattern');


% FRACTAL 9: BUSH

draw_lsystem('F', 'FF-[-F+F+F]+[+F-F-F]', '', ...
             4, 22.5, 9, '9. Fractal Bush');


% FRACTAL 10: KOCH SNOWFLAKE

draw_lsystem('F++F++F', 'F-F++F-F', '', ...
             4, 60, 10, '10. Koch Snowflake');


% FRACTAL 11: FRACTAL PLANT

draw_lsystem('G', 'FF', 'F-[[G]+G]+F[+FG]-G', ...
             6, 25, 11, '11. Fractal Plant');


% FRACTAL 12: MANDELBROT BLUE POINTS

resolution = 700;
maxIter = 100;

cx = linspace(-1.4, 0.5, resolution);
cy = linspace(-1, 1, resolution);

[XX, YY] = meshgrid(cx, cy);

C = XX + 1i * YY;
Z = zeros(size(C));
inside = true(size(C));

for k = 1:maxIter
    Z(inside) = Z(inside).^2 + C(inside);
    inside = inside & (abs(Z) <= 2);
end

figure(12);
plot(real(C(inside)), imag(C(inside)), ...
     'b.', 'MarkerSize', 3);

axis equal;
grid on;
title('12. Mandelbrot Set - Blue Points');
xlabel('Real Axis');
ylabel('Imaginary Axis');


