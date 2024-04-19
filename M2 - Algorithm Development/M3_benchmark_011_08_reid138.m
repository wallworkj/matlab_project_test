function [SSE_compactt, SSE_sedan, SSE_SUV] = M3_benchmark_011_08_reid138()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function will calculate the percentage of error between the 
% time and speed data values our algorithm produced, and the
% benchmark values provided by CruiseAuto. This program will also
% create figures to display the results of our comparison. 
%
% Function Call
% M3_benchmark_011_08_reid138()
%
% Input Arguments
% cleaned_data
%
% Output Arguments
% replace this text with a commented list of the output arguments
%
% Assignment Information 
%   Assignment:     M3, Problem 3
%   Team member:    Nia Wilson, wils1406@purdue.edu
%                   Sofia Reid, reid138@purdue.edu
%                   Joshua Wallwork, jwallwor@purdue.edu
%                   Hyunseok Lee, lee4005@purdue.edu
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
    cleaned_data = readmatrix('cleaned_data.csv'); % Don't need cleanData
    initial_time_constant = readmatrix('initialntimeconstant.csv');
    data = readmatrix("sp24_cruiseAuto_benchmark_data.csv");
    sub4_results = readmatrix('sub4_results.csv');
    
%till line 2502 in benchmark.csv We are only using benchmark data
    compact_speeds = cleaned_data(:, 1:3);
    sedan_speeds = cleaned_data(:, 4:6);
    SUV_speeds = cleaned_data(:, 7:9);

% Calculate the mean speed for each vehicle type
    compact_speed = mean(compact_speeds, 2); % Average of columns 1-3
    sedan_speed = mean(sedan_speeds, 2);     % Average of columns 4-6
    SUV_speed = mean(SUV_speeds, 2);         % Average of columns 7-9

    time = (0:0.1:(length(compact_speed)-1)*0.1)';

% Extract initial times and time constants from the matrix
    % Assuming each row corresponds to a different vehicle type (compact, sedan, SUV)
    initial_time_compact = initial_time_constant(1, 1);
    time_constant_compact = initial_time_constant(1, 2);

    initial_time_sedan = initial_time_constant(2, 1);
    time_constant_sedan = initial_time_constant(2, 2);

    initial_time_SUV = initial_time_constant(3, 1);
    time_constant_SUV = initial_time_constant(3, 2);
% Extract the initial and final speeds for each vehicle type from sub4_results
    initial_speed_compact = sub4_results(1, 2);
    final_speed_compact = sub4_results(1, 3);

    initial_speed_sedan = sub4_results(2, 2);
    final_speed_sedan = sub4_results(2, 3);

    initial_speed_SUV = sub4_results(3, 2);
    final_speed_SUV = sub4_results(3, 3);

    %Benchmark values
    acceleration_start_time = 6.8; % s
    time_constant = 1.5; % s
    initial_speed = 0.24; % m/s
    final_speed = 25.00; % m/s
    
    


%% ____________________
%% CALCULATIONS
% Calculate the predicted speeds using the first-order system response formula
    prediction_compact = initial_speed_compact + (final_speed_compact - initial_speed_compact) * ...
                         (1 - exp(-(time - initial_time_compact) / time_constant_compact));
    prediction_sedan = initial_speed_sedan + (final_speed_sedan - initial_speed_sedan) * ...
                       (1 - exp(-(time - initial_time_sedan) / time_constant_sedan));
    prediction_SUV = initial_speed_SUV + (final_speed_SUV - initial_speed_SUV) * ...
                     (1 - exp(-(time - initial_time_SUV) / time_constant_SUV));

    % Compute the SSE values for each vehicle type
    SSE_compactt = sum((compact_speed - prediction_compact).^2) / length(time);
    SSE_sedan = sum((sedan_speed - prediction_sedan).^2) / length(time);
    SSE_SUV = sum((SUV_speed - prediction_SUV).^2) / length(time);

    % Display the results
    fprintf("Compact SSE model: %.2f\n", SSE_compactt);
    fprintf("Sedan SSE model: %.2f\n", SSE_sedan);
    fprintf("SUV SSE model: %.2f\n", SSE_SUV);
end





%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS



%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



