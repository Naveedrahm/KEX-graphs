% === DATA ===
data = [
    55 50 50;
    55 50 50;
    75 55 65;
    65 45 65;
    65 55 65;
    35 55 55;
    65 75 75;
    30 25 30;
    35 30 30;
    75 70 70;
    75 65 70;
    75 65 75;
    70 45 60;
    60 55 60;
    65 55 30;
    55 50 50;
    35 40 30;
    75 65 75;
    50 55 50;
    50 40 55;
    60 65 65;
    35 20 35;
    75 75 75;
    70 65 65;
    65 65 65;
    40 45 45;
    65 65 65;
    75 75 75;
    75 75 75;
    70 65 65;
    50 35 40;
    35 30 55
];

% === BERÄKNINGAR ===
numPersons = size(data, 1);
averages = mean(data, 2);
stdPerPerson = std(data, 0, 2);

% === TABELL (valfritt) ===
T = table((1:numPersons)', data(:,1), data(:,2), data(:,3), averages, ...
    'VariableNames', {'PersonID', 'Test1', 'Test2', 'Test3', 'Average'});
disp(T)

% === PLOT + SPARA: Standardavvikelse per person ===
figure('Visible', 'off');
bar(stdPerPerson, 'FaceColor', [0.1 0.6 0.8]);
title('Standard deviation per person');
xlabel('Person number');
ylabel('Standard deviation (%)');
grid on;
exportgraphics(gcf, 'standard_deviation_group3.pdf', 'ContentType', 'vector');

% === PLOT + SPARA: Heatmap över testresultat ===
figure('Visible', 'off');
heatmap(data, ...
    'Colormap', parula, ...
    'ColorbarVisible', 'on', ...
    'XDisplayLabels', {'Test 1', 'Test 2', 'Test 3'}, ...
    'YDisplayLabels', string(1:numPersons));
title('Heatmap over test results per person');
exportgraphics(gcf, 'heatmap_testresults_group3.pdf', 'ContentType', 'vector');
