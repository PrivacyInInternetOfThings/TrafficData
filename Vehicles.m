%%
%Read DATA
tic
[Accident_Index,Vehicle_Type,Journey_Purpose_of_Driver,Sex_of_Driver,Age_Band_of_Driver,Age_of_Vehicle] = ReadVehicles('Vehicles_2015.csv');
toc
%%
%Remove unnneccessary

input_data = {  Accident_Index
                Vehicle_Type
                Journey_Purpose_of_Driver
                Sex_of_Driver
                Age_Band_of_Driver
                Age_of_Vehicle};

%Remove Missing data
for i = 2:6
    
    [row, col] = find(input_data{i}(:) == -1);
    for j = 1:6
        input_data{j}(row) = [];
    end

end

%Remove unused Vehicle Types

[row, col] = find(input_data{2}(:) == 1 | input_data{i}(:) == 16 |input_data{i}(:) == 20|input_data{i}(:) == 21|input_data{i}(:) == 22|input_data{i}(:) == 23 | input_data{i}(:) == 98);
for j = 1:6
    input_data{j}(row) = [];
end

%Remove now known purpose

[row, col] = find(input_data{3}(:) == 3);
for j = 1:6
    input_data{j}(row) = [];
end

%Remove not known sex of driver

[row, col] = find(input_data{4}(:) == 3);
for j = 1:6
    input_data{j}(row) = [];
end

toc
%%
%Write new Data to file
%Create new CSV

T = cell2table(input_data', 'VariableNames', {'Accident_Index', 'Vehicle_Type', 'Journey_Purpose_of_Driver', 'Sex_of_Driver', 'Age_Band_of_Driver', 'Age_of_Vehicle'});


tic
writetable(T, 'new_data.dat');           
toc
