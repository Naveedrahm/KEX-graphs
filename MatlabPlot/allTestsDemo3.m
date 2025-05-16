%% === DATA ===
% Namn
data_namn = [
    48 48 32 32 48 48;  % Erik
    48 48 32 32 48 48;  % Moussa
    48 48 32 32 48 48;  % Omar
    48 48 32 32 48 48;  % Piotr
    48 48 32 32 48 48   % Rahul
];
labels_namn = {'Scandinavian', 'East Africa', 'Middle Eastern', 'Eastern Europe', 'South Asia'};

% Ålder
data_alder = [
    48 48 32 32 48 48;  % 
    48 48 32 32 48 48;  % 
    48 48 32 32 48 48;  % 
    48 48 32 32 48 48;  % 
    48 48 32 32 48 48   % 
];
labels_alder = {'22', '25', '28', '31', '34'};

% Kön
data_kon = [
    48 48 32 32 48 48;  % Kvinna
    48 48 32 32 48 48;  % Kvinna
    48 48 32 32 48 48;  % Kvinna
    48 48 32 32 48 48;  % Man
    48 48 32 32 48 48   % Man
    48 48 32 32 48 48   % Man
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
