function sub4_results = M3_sub4_011_08_lee4005(cleanedDataCellArray, startTimesAndConstants)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function computes the final speed using the acceleration start times
% and constants obtained from subfunction 3.
% 
%
% Function Call
% sub4_results = M3_sub4_011_08_lee4005(cleanedDataCellArray, startTimesAndConstants)
%
% Input Arguments:
% cleanedDataCellArray - A cell array containing the cleaned data from subfunction 2.
% startTimesAndConstants - A matrix containing the acceleration start times and constants
%                            obtained from subfunction 3.
%
% Output Arguments:
% sub4_results - Results containing the final speeds computed based on the
%                acceleration start times and constants.
%
%
%
% 
%
% Assignment Information
%   Assignment:     M03, Problem 4
%   Team member:    Sofia Reid, reid138@purdue.edu
%                   Nia Wilson, 
%                   Joshua Wallwork, jwallwor@purdue.edu
%                   Hyunseok Lee, 
%   Team ID:        011-08
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers worked with: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ____________________
%% INITIALIZATION
    % Initialize results structure
    sub4_results = struct('dataset', {}, 'initialSpeed', {}, 'finalSpeed', {});
    %when you run the subfunction by itself, makesure : cleanedData = load('cleaned_data.mat');
    %cleanedDataCellArray = cleanedData.ans; cleaned data is loaded, then startTimesAndConstants = readmatrix('initialtimeconstant.csv');
    %results from sub fx 3 is also loaded. Then you can proceed to run sub
    %function 4 by this command: sub4_results = M3_sub4_011_08_lee4005(cleanedDataCellArray, startTimesAndConstants);
   
    


%% ____________________
%% CALCULATIONS
   for i = 1:length(cleanedDataCellArray)
        % Extracting current speed data
        speedData = cleanedDataCellArray{i};
        startTime = startTimesAndConstants(i, 1);
        %timeConstant = startTimesAndConstants(i, 2); not used in this
        %subfunction

        % Perform calculations
        initialSpeed = calculateInitialSpeed(speedData, startTime);
        finalSpeed = calculateFinalSpeed(speedData);

        % Store the results
        sub4_results(i).dataset = i;
        sub4_results(i).initialSpeed = initialSpeed;
        sub4_results(i).finalSpeed = finalSpeed;
    end
end

function initialSpeed = calculateInitialSpeed(speedData, startTime)
    % Logic to calculate initial speed based on speed data and start time
    % find the median speed at the start time then convert to index
    initialIndex = max(1, floor(startTime * 100));  
    initialSpeed = median(speedData(max(1, initialIndex - 5):min(end, initialIndex + 5)));
end

function finalSpeed = calculateFinalSpeed(speedData)
    % Logic to calculate final speed based on speed data by averaging the last stable values
    
    finalSpeed = mean(speedData(end - 50:end));
end