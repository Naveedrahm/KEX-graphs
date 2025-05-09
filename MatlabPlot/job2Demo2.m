% Data: Varje person (rad = person, kolumn = test)
data = [
    79 78 79; %1
    81 80 79; %2
    80 79 80; %3
    84 83 81; %4
    84 83 82; %5
    84 84 83; %6
    81 81 80; %7
    80 79 79; %8
    80 80 79; %9
    82 81 81; %10
    82 81 80; %11
    82 81 80; %12
    83 81 80; %13
    82 80 79; %14
    82 82 81; %15
    83 82 81; %16
    81 80 78; %17
    84 85 83; %18
    83 81 80; %19
    83 82 82; %20
    80 79 78; %21
    80 78 78; %22
    84 83 82; %23
    80 78 78; %24
    82 80 80; %25
    80 79 78; %26
    80 78 79; %27
    82 81 80; %28
    82 81 80; %29
    82 80 79; %30
    81 80 80; %31
    77 76 76 %32
];

% Beräkna antal personer och gruppering
numPersons = size(data, 1);
groupSize = 8;  % Antal personer per graf

% Beräkna genomsnitt för varje person
averages = mean(data, 2);

% Skapa tabell
T = table((1:numPersons)', data(:,1), data(:,2), data(:,3), averages, ...
    'VariableNames', {'PersonID', 'Test1', 'Test2', 'Test3', 'Average'});
disp(T)

% Gör regression per person, plocka ut lutningar (trender)
%slopes = zeros(numPersons, 1);
%for i = 1:numPersons
    %p = polyfit(1:3, data(i,:), 1);  % linjär regression: y = p(1)*x + p(2)
    %slopes(i) = p(1);
%end

%figure;
%histogram(slopes);
%title('Histogram över trender (lutningar) i testresultat');
%xlabel('Lutning (positiv = förbättring)');
%ylabel('Antal personer');

stdPerPerson = std(data, 0, 2);
figure;
bar(stdPerPerson);
title('Standard deviation per person');
xlabel('Person number');
ylabel('Standard deviation (%)');
grid on;

figure;
heatmap(data, 'Colormap', parula, 'ColorbarVisible','on');
title('Heatmap over testresults per person');
xlabel('Test number');
ylabel('Person number');
