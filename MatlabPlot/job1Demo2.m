% Data: Varje person (rad = person, kolumn = test)
data = [
    82 82 82; %1
    81 80 80; %2
    78 78 78; %3
    83 81 82; %4
    82 82 81; %5
    82 81 82; %6
    81 80 80; %7
    81 79 79; %8
    81 80 79; %9
    79 77 78; %10
    81 79 80; %11
    80 78 79; %12
    86 85 85; %13
    83 82 82; %14
    82 82 81; %15
    80 79 80; %16
    82 81 81; %17
    83 83 83; %18
    83 81 82; %19
    80 79 80; %20
    82 82 82; %21
    84 83 84; %22
    81 80 80; %23
    83 81 81; %24
    85 83 84; %25
    84 83 83; %26
    77 75 76; %27
    83 84 83; %28
    85 85 84; %29
    84 83 84; %30
    78 77 78; %31
    84 83 83 %32
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
