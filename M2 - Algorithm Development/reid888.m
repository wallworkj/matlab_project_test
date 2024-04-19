function [all_data] = M2_sub2_011_08_reid138()
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
time = data(:,1);
disp(size(data))

%% ____________________
%% CALCULATIONS
%Nan and Outliers
data = data(~isnan(data));
disp(size(data))
% ^ problem source
data(isnan(data)) = [];
% can't do          ^ this because it moves the speed data 
% asynchronously, making the data smaller and reshaping the matrix into a
% single row/column depending on other statements; 
% solution(s): do this "manually" with for loops, and replace with the 
% average value of its nearest neighbors

average = mean(data, 'omitnan');
change = std(data, 'omitnan');
outliers = abs(data - average) > 3 * change;

% Comment from Joshua Wallwork: above and below line does not work because it is 
% calculating the outliers of ALL of the data; do these steps once
% replacement values are found for NaN.

data(outliers) = [];

% New clean returns
clean_compact_summer = mean(data,2:6);
disp(size(clean_compact_summer))
clean_compact_allSeason = mean(data,7:11);
disp(size(clean_compact_allSeason))
clean_compact_winter = mean(data,12:16);
clean_sedan_summer = mean(data,17:21);
clean_sedan_allSeason = mean(data, 22:26);
clean_sedan_winter = mean(data,27:31);
clean_suv_summer = mean(data,32:36);
clean_suv_allSeason = mean(data, 37:41);
clean_suv_winter = mean(data, 42:46);

% Comment from Joshua Wallwork: error must have been made somewhere because
% all of the data should by the same size so that there is no error in the
% below statement

% output - Edited by Joshua Wallwork for organization, and consistency of
% output (expected output size should be 5001 by 9 (5001 speeds, for each
% test scenario)

all_data = {clean_compact_summer, clean_compact_allSeason, 
    clean_compact_winter, clean_sedan_summer, clean_sedan_allSeason, 
    clean_sedan_winter, clean_suv_summer, clean_suv_allSeason, 
    clean_suv_winter};

writematrix(all_data, "cleandata.csv")

end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are sub