%% === DATA ===
% Namn
data_namn = [
    83 82 83 81 78 80;  % Erik
    80 80 81 80 76 78;  % Moussa
    80 80 81 80 77 78;  % Omar
    79 80 81 79 76 77;  % Piotr
    79 80 81 80 76 77   % Rahul
];
labels_namn = {'Scandinavian', 'East Africa', 'Middle Eastern', 'Eastern Europe', 'South Asia'};

% Ålder
data_alder = [
    83 81 81 84 84 79;
    83 81 81 84 84 79;
    83 81 81 84 84 79;
    83 81 81 84 84 79;
    83 81 81 84 83 79
];
labels_alder = {'22', '25', '28', '31', '34'};

% Kön
data_kon = [
    80 82 81 82 78 81; %Kvinna
    81 82 81 82 79 82; %Kvinna
    80 82 81 81 79 82; %Kvinna
    80 81 81 82 77 80; %man
    80 82 82 82 77 80; %man
    81 83 82 82 79 82 %man
];
labels_kon = {'Kvinna', 'Kvinna', 'Kvinna', 'Man', 'Man', 'Man'};

%% Plottar genomosnittet, en funkition 
function plotGroupAverages(data, labels, groupTitle)
    uniqueGroups = unique(labels);
    means = zeros(length(uniqueGroups), 1);
    
    for i = 1:length(uniqueGroups)
        idx = strcmp(labels, uniqueGroups{i});
        means(i) = mean(data(idx,:), 'all');
    end
    
    figure;
    bar(means);
    set(gca, 'XTickLabel', uniqueGroups);
    title(['Average score: ', groupTitle]);
    ylabel('Average Testresults (%)');
    ylim([70 90]);
    grid on;
end

%% Plottar för varje grupp
plotGroupAverages(data_namn, labels_namn, 'Demographic Name');
plotGroupAverages(data_alder, labels_alder, 'Age groups');
plotGroupAverages(data_kon, labels_kon, 'Gender');
