function [times] = M2_subfunction_3_011_08_jwallwor(speeds)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program will return the initial time
%
% Function Call
% M2_subfunction_3_011_08_jwallwor
%
% Input Arguments
% 9 arrays of data 5001 by 1 containing the denoised speeds of each test
% type
%
% Output Arguments
% 9 arrays of data 1 by 2: column 1 contains the
% inital time where the differential equation starts; column 2 contains the
% time constant that functions as the exponential coefficient of the
% solution to the differential equation.
%
% Assignment Information
%   Assignment:     M02, Problem 2
%   Team member:    Sofia Reid, reid138@purdue.edu
%                   Nia Wilson, wils1406@purdue.edu
%                   Joshua Wallwork, jwallwor@purdue.edu
%                   Hyunseok Lee, 
%   Team ID:        011-08
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: None
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setup
    x = [0, 0]; % says what to make each space of output
    times = {x, x, x, x, x, x, x, x, x}; % formats output in cell array to avoid mashing data together
%% Finds the average speed of the first 1.5 seconds
    averages = [0, 0, 0, 0, 0, 0, 0, 0, 0]; 
    for i = 1:1:151
        for j = 1:1:9
            averages(j) = averages(j) + speeds(j, i) / 150;
        end
    end
%% Computes standard deviation of average speed over the first 1.5 seconds
    std_dev_vals = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 1:1:151
        for j = 1:1:9
            std_dev_vals(j) = std_dev_vals(j) + ((speeds(j, i)- averages(j)).^2 / 151);
        end
    end
    % disp(std_dev_vals) % tool to see if the bound needs to be adjusted 
    % later on
%% Calculates the start time
    startValues = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 152:1:1000
        if ismember(0, startValues) == 0
            break;
        else
        end
        for j = 1:1:9
            if (speeds(j, 2, i) > averages(j) + 2.5 * std_dev_vals(j) && ...
                    startValues(j) == 0)
                startValues(j) = i - 1;
                times(j, 1) = (i - 1) / 100;
            else
            end
        end
    end
%% Calculates assymptote stat. info. based on average of last 5 seconds
    aprroxassymptotes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for j = 1:1:9
        for i = 4502:1:5001
            aprroxassymptotes(j) = (aprroxassymptotes(j) + speeds(j, i)) / 1000;
        end
    end
    std_dev_vals = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 4502:1:5001
        for j = 1:1:9
            std_dev_vals(j) = std_dev_vals(j) + ((speeds(j, i)- aprroxassymptotes(j)).^2 / 500);
        end
    end
%% Calculates the end time
endValues = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 4501:-1:1000
        if ismember(0, endValues) == 0
            break;
        else
        end
        for j = 1:1:9
            if (speeds(j, 2, i) < averages(j) - 2.5 * std_dev_vals(j) && ...
                    endValues(j) == 0)
                endValues(j) = i - 1;
            else
            end
        end
    end
%% Find T based on the curved part
    add = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for j = 1:1:9
        for i = (startValues(j) + 1):1:(endValues(j) + 1)
            add(j) = add(j) + (1 / (((i / 100) - startValues(j)) * ...
                (-1 * log(1 - ((speeds(j, i) - averages(j)) / ...
                (aprroxassymptotes(j) - averages(j)))))));
        end
        times(j, 2) = add(j) / (endValues(j) - startValues(j));
    end
end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.