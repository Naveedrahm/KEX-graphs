% === DATA: Varje person (rad = person, kolumn = test) ===
data = [
    71 71 71;
    64 64 64;
    48 48 48;
    56 56 56;
    46 46 46;
    64 64 64;
    38 38 38;
    38 38 38;
    38 38 38;
    38 38 38;
    38 38 38;
    48 48 48;
    54 54 54;
    71 71 71;
    48 48 48;
    38 38 38;
    38 38 38;
    56 56 56;
    56 56 56;
    48 48 48;
    71 71 71;
    71 71 71;
    56 56 56;
    71 71 71;
    71 71 71;
    71 71 71;
    46 46 46;
    87 87 87;
    71 71 71;
    71 71 71;
    48 48 48;
    71 71 71
];

% === Beräkningar ===
numPersons = size(data, 1);
averages = mean(data, 2);
stdPerPerson = std(data, 0, 2);

% === Skapa tabell (valfritt att visa i terminal) ===
T = table((1:numPersons)', data(:,1), data(:,2), data(:,3), averages, ...
    'VariableNames', {'PersonID', 'Test1', 'Test2', 'Test3', 'Average'});
disp(T)

% === Plot & spara: Standardavvikelse per person ===
figure('Visible', 'off');
bar(stdPerPerson, 'FaceColor', [0.2 0.4 0.6]);
title('Standard deviation per person');
xlabel('Person number');
ylabel('Standard deviation (%)');
grid on;
exportgraphics(gcf, 'standard_deviation_per_person.pdf', 'ContentType', 'vector');

% === Plot & spara: Heatmap ===
figure('Visible', 'off');
heatmap(data, ...
    'Colormap', parula, ...
    'ColorbarVisible','on', ...
    'XDisplayLabels', {'Test 1', 'Test 2', 'Test 3'}, ...
    'YDisplayLabels', string(1:numPersons));
title('Heatmap over test results per person');
exportgraphics(gcf, 'heatmap_test_results.pdf', 'ContentType', 'vector');
