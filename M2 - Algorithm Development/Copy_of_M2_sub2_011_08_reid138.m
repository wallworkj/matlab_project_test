function [all_data] = Copy_of_M2_sub2_011_08_reid138()
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
%                   Hyunseok Lee, 
%   Team ID:        011-08
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers worked with: Joshua Wallwork, jwallwor@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

data = readmatrix("sp24_cruiseAuto_experimental_data.csv");

cleaned_data = data;
for colIdx = 2:size(data, 2)
    column_data = data(:, colIdx);
        
    nanIndices = isnan(column_data);% Replace NaNs with the mean of the non-NaN values
    column_data(nanIndices) = mean(column_data(~nanIndices), 'omitnan');
        
    % Calculate mean and standard deviation for outlier detection
    colMean = mean(column_data, 'omitnan');
    colStd = std(column_data, 'omitnan');
        
    % Identify outliers and replace them with the mean
    outliers = abs(column_data - colMean) > 3 * colStd;
    column_data(outliers) = colMean;
        
    % Store cleaned data
    clean_data(:, colIdx) = column_data
end
    
   all_data = vehicleMeans;
    
    % Display a success message
    disp('Data processing completed successfully.');
end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.


