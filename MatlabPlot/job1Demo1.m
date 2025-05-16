% === DATA: Varje person (rad = person, kolumn = test) ===
data = [
    82 82 82;
    81 80 80;
    78 78 78;
    83 81 82;
    82 82 81;
    82 81 82;
    81 80 80;
    81 79 79;
    81 80 79;
    79 77 78;
    81 79 80;
    80 78 79;
    86 85 85;
    83 82 82;
    82 82 81;
    80 79 80;
    82 81 81;
    83 83 83;
    83 81 82;
    80 79 80;
    82 82 82;
    84 83 84;
    81 80 80;
    83 81 81;
    85 83 84;
    84 83 83;
    77 75 76;
    83 84 83;
    85 85 84;
    84 83 84;
    78 77 78;
    84 83 83
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
