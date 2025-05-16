%% === DATA ===
% Namn
data_namn = [
    45 45 65 40 20 10;  % Erik
    50 40 65 65 20 10;  % Moussa
    50 45 75 55 10 20;  % Omar
    40 50 65 65 10 20;  % Piotr
    55 50 55 65 10 10   % Rahul
];
labels_namn = {'Scandinavian', 'East Africa', 'Middle Eastern', 'Eastern Europe', 'South Asia'};

% Ålder
data_alder = [
    45 50 70 75 20 10;
    45 50 75 75 10 10;
    35 50 60 70 20 10;
    45 55 75 65 20 10;
    40 44 75 75 20 10
];
labels_alder = {'22', '25', '28', '31', '34'};

% Kön
data_kon = [
    55 45 60 55 10 10; %Kvinna
    50 55 65 55 10 10; %Kvinna
    55 40 65 55 10 10; %Kvinna
    45 55 40 55 20 20; %man
    50 45 6 555 20 10; %man
    60 55 55 55 10 10  %man
];
labels_kon = {'Woman', 'Woman', 'Woman', 'Man', 'Man', 'Man'};

%% === Funktion som plottar och sparar figuren som PDF ===
function plotGroupAverages(data, labels, groupTitle, filename)
    uniqueGroups = unique(labels);
    means = zeros(length(uniqueGroups), 1);
    
    for i = 1:length(uniqueGroups)
        idx = strcmp(labels, uniqueGroups{i});
        means(i) = mean(data(idx,:), 'all');
    end

    figure('Visible', 'off');  % 'off' om du inte vill öppna figuren varje gång
    b = bar(means);
    colors = lines(length(uniqueGroups));
    for i = 1:length(uniqueGroups)
        b.CData(i,:) = colors(i,:);
    end

    set(gca, 'XTickLabel', uniqueGroups);
    title(['Average score: ', groupTitle]);
    ylabel('Average Testresults (%)');
    %ylim([70 90]);
    grid on;

    % Spara figuren som PDF
    exportgraphics(gcf, [filename, '.pdf'], 'ContentType', 'vector');
end

%% === Plottar och sparar för varje grupp ===
plotGroupAverages(data_namn, labels_namn, 'Demographic Name', 'average_name');
plotGroupAverages(data_alder, labels_alder, 'Age groups', 'average_age');
plotGroupAverages(data_kon, labels_kon, 'Gender', 'average_gender');
