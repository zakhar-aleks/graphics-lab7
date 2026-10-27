
function draw_lsystem(axiom, ruleF, ruleG, iterations, angleDeg, figNum, figTitle)
    word = axiom;

    for k = 1:iterations
        word = strrep(word, 'F', ruleF);

        if ~isempty(ruleG)
            word = strrep(word, 'G', ruleG);
        end
    end

    x = 0;
    y = 0;
    angle = 0;

    stack = zeros(0, 3);

    X = [];
    Y = [];

    for k = 1:length(word)
        symbol = word(k);

        switch symbol
            case {'F', 'G', 'H'}
                newX = x + cosd(angle);
                newY = y + sind(angle);

                X(end+1:end+3) = [y, newY, NaN];
                Y(end+1:end+3) = [x, newX, NaN];

                x = newX;
                y = newY;

            case '+'
                angle = angle + angleDeg;

            case '-'
                angle = angle - angleDeg;

            case '['
                stack(end+1, :) = [x, y, angle];

            case ']'
                if ~isempty(stack)
                    x = stack(end, 1);
                    y = stack(end, 2);
                    angle = stack(end, 3);
                    stack(end, :) = [];
                end
        end
    end

    figure(figNum);
    clf;
    plot(X, Y, 'k-', 'LineWidth', 0.7);
    axis equal;
    grid on;
    title(figTitle);
    xlabel('X');
    ylabel('Y');
end

