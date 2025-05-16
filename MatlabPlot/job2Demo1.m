% === DATA ===
data = [
    50 35 45;
    75 75 75;
    75 75 65;
    55 50 55;
    55 55 65;
    75 75 75;
    75 75 65;
    40 30 35;
    40 40 50;
    80 70 85;
    75 55 65;
    55 65 65;
    50 55 55;
    50 55 55;
    55 60 45;
    85 75 75;
    20 30 30;
    75 70 75;
    50 55 60;
    75 65 75;
    55 55 55;
    20 40 40;
    75 75 75;
    65 60 65;
    65 70 75;
    20 35 25;
    60 65 65;
    85 85 85;
    65 65 65;
    70 70 75;
    70 75 75;
    45 20 20
];

% === BERÄKNINGAR ===
numPersons = size(data, 1);
averages = mean(data, 2);
stdPerPerson = std(data, 0, 2);

% === TABELL (valfritt) ===
T = table((1:numPersons)', data(:,1), data(:,2), data(:,3), averages, ...
    'VariableNames', {'PersonID', 'Test1', 'Test2', 'Test3', 'Average'});
disp(T)

% === STANDARDAVVIKELSE: PLOT + PDF ===
figure('Visible', 'off');
bar(stdPerPerson, 'FaceColor', [0.1 0.6 0.8]);
title('Standard deviation per person');
xlabel('Person number');
ylabel('Standard deviation (%)');
grid on;
exportgraphics(gcf, 'standard_deviation_group2.pdf', 'ContentType', 'vector');

% === HEATMAP: PLOT + PDF ===
figure('Visible', 'off');
heatmap(data, ...
    'Colormap', parula, ...
    'ColorbarVisible', 'on', ...
    'XDisplayLabels', {'Test 1', 'Test 2', 'Test 3'}, ...
    'YDisplayLabels', string(1:numPersons));
title('Heatmap over test results per person');
exportgraphics(gcf, 'heatmap_testresults_group2.pdf', 'ContentType', 'vector');
