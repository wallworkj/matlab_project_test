function [clean_data] = M3_sub2_011_08_reid138()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes the data from the csv file removing noise, outliers, and
% erroneous data, averaging tests of the same kind to produce a cleaner set
% of data
%
% Function Call
% M2_sub2_011_08_reid138()
%
% Input Arguments:
% none
%
% Output Arguments:
%
% all_data, a 5001 by 9 matrix which contains 5001 clean speed data points
% for:
%
% clean_compact_summer
% clean_compact_allSeason
% clean_compact_winter
% clean_sedan_summer
% clean_sedan_allSeason
% clean_sedan_winter
% clean_suv_summer
% clean_suv_allSeason
% clean_suv_winter
%
% Assignment Information
%   Assignment:     M02, Problem 2
%   Team member:    Sofia Reid, reid138@purdue.edu
%                   Nia Wilson, 
%                   Joshua Wallwork, jwallwor@purdue.edu
%                   Hyunseok Lee, lee4005@purdue.edu
%   Team ID:        011-08
%   Academic Integrity:
%     [O] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers worked with: Joshua Wallwork, jwallwor@purdue.edu, Hyunseok
%     Lee, lee4005@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
data = readmatrix("sp24_cruiseAuto_experimental_data.csv");
clean_data = data; %copy of data
%% ____________________
%% CALCULATIONS
for colIdx = 2:size(data, 2)
    column_data = data(:, colIdx);
    
    % Replace NaNs with the mean of the non NaNs
    nanIndices = isnan(column_data);
    column_data(nanIndices) = mean(column_data(~nanIndices), 'omitnan');
    
    % mean and standard deviation for outlier detection
    colMean = mean(column_data, 'omitnan');
    colStd = std(column_data, 'omitnan');
    
    % Identify outliers and replace them with the mean
    outliers = abs(column_data - colMean) > 3 * colStd;
    column_data(outliers) = colMean;
    
    % Store cleaned data
    clean_data(:, colIdx) = column_data;
end

%% CALCULATING MEANS FOR EACH VEHICLE-TIRE COMBINATION
% Preallocating cell array for mean speeds (9 diff cases)
clean_means = cell(1, 9);

%calculate means across the specified columns for each condition
clean_means{1} = mean(clean_data(:, 2:6), 2); % Compact summer
clean_means{2} = mean(clean_data(:, 7:11), 2); % Compact allSeason
clean_means{3} = mean(clean_data(:, 12:16), 2); % Compact winter
clean_means{4} = mean(clean_data(:, 17:21), 2); % Sedan summer
clean_means{5} = mean(clean_data(:, 22:26), 2); % Sedan allSeason
clean_means{6} = mean(clean_data(:, 27:31), 2); % Sedan winter
clean_means{7} = mean(clean_data(:, 32:36), 2); % SUV summer
clean_means{8} = mean(clean_data(:, 37:41), 2); % SUV allSeason
clean_means{9} = mean(clean_data(:, 42:46), 2); % SUV winter

clean_data = clean_means;
clean_matrix = cell2mat(clean_means); %cell array of column vectors into matrix
writematrix(clean_matrix, 'cleaned_data.csv'); %matrix to csv
end
%saved results "cleaned_data.csv"

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.


