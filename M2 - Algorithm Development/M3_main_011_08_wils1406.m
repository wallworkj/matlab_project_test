function M3_main_011_08_wils1406
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program will clean the data by managing all data noise and error, 
% then call three different subfunctions to calculate the initial and
% final speeds of the data, as well as the acceleration start time and 
% the time constant. The findings will then be displayed via graphs and 
% formatted text displays. 
%
% Function Call
% M2_main_011-08_wils1406
%
% Input Arguments
% NONE
%
% Output Arguments
% NONE
%
% Assignment Information
%   Assignment:     M02, Problem 2
%   Team member:    Sofia Reid, reid138@purdue.edu
%                   Nia Wilson, wils1406@purdue.edu
%                   Joshua Wallwork, jwallwor@purdue.edu
%                   Hyunseok Lee, lee4005@purdue.edu
%   Team ID:        011-08
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with:Hyunseok Lee, lee4005@purdue.edu  [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

 data = readmatrix("sp24_cruiseAuto_experimental_data.csv");
 results = readmatrix('newconsts.csv');% contain a variable 'newconsts' with subfunction 3 data
 
 load('sub4_results.mat');  % contain a variable 'sub4_results' with subfunction 4 data
 M3_sub3_011_08_jwallwor("cleaned_data.csv"); % find the start time and time constants from clean data
 cleaned_data = load('cleaned_data.csv'); 
 num_conditions = 9; %9 conditions (3 vehicle types * 3 tire seasons) we preallocate array for speeds for each condition
 speeds = cell(num_conditions, 1);
 time = data(:, 1);
 % Initialize variables for plotting to avoid "Unrecognized function or variable" errors.
left_speed = []; right_speed = []; compact_speed = []; sedan_speed = []; suv_speed = [];
speed1 = []; speed2 = []; speed3 = []; speed4 = []; speed5 = []; speed6 = []; speed7 = []; speed8 = []; speed9 = [];

% Attempt to call the performance function and catch any errors.
try
    [left_speed, right_speed, compact_speed, sedan_speed, suv_speed,...
     speed1, speed2, speed3, speed4, speed5, speed6, speed7, speed8,...
     speed9] = M3_performance_011_08_wils1406(speeds, time);
catch e
    fprintf('Error calling performance function: %s\n', e.message);
    return;
end

    % Indices for the vehicle type within cleaned_data
    %compact_indices = [1, 2, 3]; 
    %sedan_indices = 4:6;   
    %SUV_indices = 7:9;    
    %compact = cleaned_data(:, compact_indices);
    %sedan = cleaned_data(:, sedan_indices);
    %SUV = cleaned_data(:, SUV_indices);
 %for i = 1:num_conditions
    % speeds{i} = zeros(length(time), 1);
 %end
%% ____________________
%% CALCULATIONS
  %for i = 1:num_conditions %%following Nia's approach
    %    accell_start = results(i, 1);      % Initial time from subfunction 3
      %  time_constant = results(i, 2);    % Time constant from subfunction 3
     %   initial_speed = sub4_results(i).initialSpeed; % Initial speed from subfunction 4
      %  final_speed = sub4_results(i).finalSpeed;    % Final speed from subfunction 4

    %    speeds{i} = zeros(length(time), 1);  % Initialize speed array for this condition
     %   for index = 1:length(time)
%if time(index) < accell_start
     %           speeds{i}(index) = initial_speed;
     %       else
      %          speeds{i}(index) = initial_speed + (final_speed - initial_speed) * ...
     %                              (1 - exp(-((time(index) - accell_start) / time_constant)));
     %       end
    %    end
   % end
%% CALCULATIONS
    for i = 1:num_conditions
        % Access the results for initial time and time constant from 'newconsts.csv'
        accell_start = results(i, 1);
        time_constant = results(i, 2);
        
        % Access the results for initial and final speed from 'sub4_results.mat'
        initial_speed = sub4_results(i).initialSpeed; % Access the initial speed
        final_speed = sub4_results(i).finalSpeed;     % Access the final speed
        
        % Initialize speed array for this condition
        speeds{i} = zeros(length(time), 1);  
        
        % Calculate speeds using the first-order system response
        for index = 1:length(time)
            if time(index) < accell_start
                speeds{i}(index) = initial_speed;
            else
                speeds{i}(index) = initial_speed + (final_speed - initial_speed) * ...
                                   (1 - exp(-((time(index) - accell_start) / time_constant)));
            end
        end
    end
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% Clean data figures
    %cleaned_data = load('cleaned_data.csv');

    figure(1)
    % Compact Hatchback Data
    sgtitle("Compact Hatchback Data")
    % Summer Tires
    subplot(1,3,1)
    plot(time, cleaned_data(:,1))
    title("Summer Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % All-Season Tires
    subplot(1,3,2)
    plot(time, cleaned_data(:,2))
    title("All-Season Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % Winter Tires
    subplot(1,3,3)
    plot(time, cleaned_data(:,3))
    title("Winter Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on


    figure(2)
    % Midsize Four Door Sedan Data
    sgtitle("Midsize Four Door Sedan Data")
    % Summer Tires
    subplot(1,3,1)
    plot(time, cleaned_data(:,4))
    title("Summer Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % All-Season Tires
    subplot(1,3,2)
    plot(time, cleaned_data(:,5))
    title("All-Season Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % Winter Tires
    subplot(1,3,3)
    plot(time, cleaned_data(:,6))
    title("Winter Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on

    figure(3)
    % Midsize SUV Data
    sgtitle("Midsize SUV Data")
    % Summer Tires
    subplot(1,3,1)
    plot(time, cleaned_data(:,7))
    title("Summer Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % All-Season Tires
    subplot(1,3,2)
    plot(time, cleaned_data(:,8))
    title("All-Season Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on
    % Winter Tires
    subplot(1,3,3)
    plot(time, cleaned_data(:,9))
    title("Winter Tires")
    xlabel("Time [seconds]")
    ylabel("Speed [meters/second]")
    grid on

% Performace figures

[left_speed, right_speed, compact_speed, sedan_speed, suv_speed,...
 speed1, speed2, speed3, speed4, speed5, speed6, speed7, speed8,...
 speed9] = M3_performance_011_08_wils1406(speeds, time);
% [performance_figures] = M3_performance_011_08_wils1406(speeds, time);

figure(4)
% Compact Hatchback Performace Figure
plot(time, left_speed, ':')
hold on
plot(time, right_speed, ':')
hold on
plot(time, compact_speed, '-')
hold on
plot(time, speed1, 'g-')
hold on 
plot(time, speed2, 'r-')
hold on
plot(time, speed3, 'b-')
title("Compact Hatchback Performance")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on
legend("Left Boundary", "Right Boundary", "Benchmark", "Summer Tires", "All-Season Tires", "Winter Tires", "Location","southeast")

figure(5)
% Midsize Four Door Sedan Figure
plot(time, left_speed, ':')
hold on
plot(time, right_speed, ':')
hold on
plot(time, sedan_speed, '-')
hold on
plot(time, speed4, 'g-')
hold on
plot(time, speed5, 'r-')
hold on
plot(time, speed6, 'b-')
title("Midsize Four Door Sedan Performance")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on
legend("Left Boundary", "Right Boundary", "Benchmark", "Summer Tires", "All-Season Tires", "Winter Tires", "Location","southeast")

figure(6)
% Midsize SUV Performance Figure
plot(time, left_speed, ':')
hold on
plot(time, right_speed, ':')
hold on
plot(time, suv_speed, '-')
hold on
plot(time, speed7, 'g-')
hold on
plot(time, speed8, 'r-')
hold on
plot(time, speed9, 'b-')
title("Midsize SUV Performance")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on
legend("Left Boundary", "Right Boundary", "Benchmark", "Summer Tires", "All-Season Tires", "Winter Tires", "Location","southeast")


[cleaned_data] = M3_benchmark_011_08_reid138(); % fx call
%Benchmark Graphs:
figure (7);

% Subplot for Compact
subplot(3, 1, 1);
plot(time(time >= 5), compact(time >= 5), 'b', 'DisplayName', 'Data');
hold on;
line([5 5], ylim, 'Color', 'k', 'LineStyle', '--', 'DisplayName', 'Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Compact');
legend;

% Subplot for Sedan
subplot(3, 1, 2);
plot(time(time >= 5), sedan(time >= 5), 'r', 'DisplayName', 'Data');
hold on;
line([5 5], ylim, 'Color', 'k', 'LineStyle', '--', 'DisplayName', 'Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Sedan');
legend;

% Subplot for SUV
subplot(3, 1, 3);
plot(time(time >= 5), SUV(time >= 5), 'g', 'DisplayName', 'Data');
hold on;
line([5 5], ylim, 'Color', 'k', 'LineStyle', '--', 'DisplayName', 'Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('SUV');
legend;


figure(8)

%% Compact Model
subplot(3, 1, 1);
plot(time(time >= 5), compact(time >= 5), 'b', time(time >= 5), prediction_compact(time >= 5), 'r--');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Compact Model');
legend('Observed Data', 'Model Prediction');
grid on;

%%Sedan Model
subplot(3, 1, 2);
plot(time(time >= 5), sedan(time >= 5), 'b', time(time >= 5), prediction_sedan(time >= 5), 'r--');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Sedan Model');
legend('Observed Data', 'Model Prediction');
grid on;
%SUV model
subplot(3, 1, 3);
plot(time(time >= 5), SUV(time >= 5), 'b', time(time >= 5), prediction_suv(time >= 5), 'r--');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('SUV Model');
legend('Observed Data', 'Model Prediction');
grid on;
%% ____________________
%% RESULTS

 vehicleTypes = {'Compact Hatchback', 'Midsize Four-Door Sedan', 'Midsize SUV'};
 tireTypes = {'Summer', 'All-Season', 'Winter'};

 % Print results for each condition
    for i = 1:num_conditions
        fprintf("Results for the %s - %s Tires:\n", vehicleTypes{ceil(i/3)}, tireTypes{mod(i-1,3)+1});
        fprintf("Acceleration Start Time: %.2f s\n", results(i, 1));
        fprintf("Time Constant: %.2f s\n", results(i, 2));
        fprintf("Initial Speed: %.2f m/s\n", sub4_results(i, 2));
        fprintf("Final Speed: %.2f m/s\n\n", sub4_results(i, 3));
    end
end

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
