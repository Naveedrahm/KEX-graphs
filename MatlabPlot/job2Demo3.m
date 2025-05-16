% === DATA ===
data = [
    20 20 20;
    35 35 35;
    32 32 32;
    35 35 35;
    31 31 31;
    32 32 32;
    42 42 42;
    32 32 32;
    23 23 23;
    35 35 35;
    30 30 30;
    35 35 35;
    23 23 23;
    23 23 23;
    32 32 32;
    46 46 46;
    23 23 23;
    35 35 35;
    35 35 35;
    52 52 52;
    20 20 20;
    20 20 20;
    35 35 35;
    23 23 23;
    20 20 20;
    20 20 20;
    25 25 25;
    25 25 25;
    20 20 20;
    23 23 23;
    35 35 35;
    20 20 20
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
