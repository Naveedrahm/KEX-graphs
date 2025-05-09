% Data: Varje person (rad = person, kolumn = test)
data = [
    83 85 85; %1
    83 79 79; %2
    81 78 78; %3
    84 81 81; %4
    85 82 82; %5
    86 82 82; %6
    81 79 80; %7
    83 79 80; %8
    81 77 79; %9
    82 78 79; %10
    82 79 79; %11
    83 79 79; %12
    88 87 87; %13
    85 84 84; %14
    84 81 81; %15
    82 80 80; %16
    82 81 80; %17
    86 82 82; %18
    86 83 82; %19
    83 80 80; %20
    84 83 84; %21
    84 84 84; %22
    83 80 80; %23
    84 83 84; %24
    86 85 86; %25
    83 82 82; %26
    79 76 76; %27
    84 85 85; %28
    85 85 85; %29
    86 84 84; %30
    81 77 77; %31
    82 82 82 %32
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
