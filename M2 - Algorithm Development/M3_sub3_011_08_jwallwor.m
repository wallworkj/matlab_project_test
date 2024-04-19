function M3_sub3_011_08_jwallwor(clean_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program will return the initial time
%
% Function Call
% M3_subfunction_3_011_08_jwallwor
%
% Input Arguments
% an file of data 5001 by 9 containing the denoised speeds of each test
% type
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:     M02, Problem 3
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
    %cleaned data is in cleaned_data.mat under directory. It's easier to
    %use .mat to load since its already in cell format instead loading csv.
    %csv is there just to verify if subfunction 2 successfully filters and
    %remove outliers/null values. just need to figureout and implement
    %those cleanData into subfx 3
    speeds = load(clean_data);
    x = [0, 0]; % says what to make each space of output
    times = {x; x; x; x; x; x; x; x; x}; % formats output in cell array to avoid mashing data together
%% Finds the average speed of the first 1.5 seconds
    averages = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 1:1:201
        for j = 1:1:9
            averages(j) = averages(j) + speeds(i, j);
        end
    end
    for j = 1:1:9
        averages(j) = averages(j) / 200;
    end
%% Computes standard deviation of average speed over the first 1.5 seconds
    std_dev_vals = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 1:1:201
        for j = 1:1:9
            std_dev_vals(j) = std_dev_vals(j) + ((speeds(i, j)- averages(j)).^2 / 200);
        end
    end
    avgsdv = sum(std_dev_vals, "all") / 9;
    for j = 1:1:9
        std_dev_vals(j) = (std_dev_vals(j) + avgsdv) / 2;
    end
    % later on
%% Calculates the start time
    startValues = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 202:1:1000
        if ismember(0, startValues) == 0
            break;
        else
        end
        for j = 1:1:9
            if (speeds(i, j) > averages(j) + 5 * std_dev_vals(j) && ...
                    startValues(j) == 0 && ...
                    speeds(i+1, j) > averages(j) + 5 * std_dev_vals(j))
                tempstart = i;
                for k = tempstart:-1:200
                    if (speeds(k, j) < averages(j) + .5 * std_dev_vals(j))
                        startValues(j) = k;
                        times{j}(1) = (k) / 100;
                        break;
                    else
                    end
                end
                break;
            else
            end
        end
    end
%% Calculates assymptote stat. info. based on average of last 5 seconds
    aprroxassymptotes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for j = 1:1:9
        for i = 4502:1:5001
            aprroxassymptotes(j) = (aprroxassymptotes(j) + speeds(i,j));
        end
        aprroxassymptotes(j) = aprroxassymptotes(j) / 500;
    end
    std_dev_vals = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 4502:1:5001
        for j = 1:1:9
            std_dev_vals(j) = std_dev_vals(j) + ((speeds(i,j)- aprroxassymptotes(j)).^2 / 500);
        end
    end
%% Calculates the end time
    endValues = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 4501:-1:1000
        if ~(ismember(0, endValues))
            break;
        else
        end
        for j = 1:1:9
            if (speeds(i,j) < aprroxassymptotes(j) - 8 * std_dev_vals(j) && ...
                    endValues(j) == 0 && ...
                    speeds(i-1,j) < aprroxassymptotes(j) - 8 * ...
                    std_dev_vals(j))
                tempend = i;
                for k = tempend:4501
                    if (speeds(k, j) > aprroxassymptotes(j) - .5 * std_dev_vals(j))
                        endValues(j) = k;
                    end
                end
            else
            end
        end
    end
    currentaveragevalue = 0;
    timeconstantests = [0, 0, 0, 0, 0, 0, 0, 0, 0];
%% Find T based on the curved part
    for j = 1:1:9
        for i = (startValues(j) + 1):1:4000
            if speeds(i, j) > averages(j)
                for k = i-5:i+5
                    currentaveragevalue = currentaveragevalue + speeds(i, j);
                end
                currentaveragevalue = currentaveragevalue / 11;
                if (currentaveragevalue - .632 * (aprroxassymptotes(j) - speeds(startValues(j),1)))^2 < (timeconstantests(j) - .632 * (aprroxassymptotes(j) - speeds(startValues(j), 1)))^2
                    timeconstantests(j) = currentaveragevalue;
                    times{j}(2) = (i -startValues(j)) / 100;
                else
                end
            end
        end
    end
    finalMatrix = vertcat(times{:});
    writematrix(finalMatrix, 'newconsts.csv')
end
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.