function [left_speed, right_speed, compact_speed, sedan_speed, suv_speed,...
          speed1, speed2, speed3, speed4, speed5, speed6, speed7, speed8,...
          speed9] = M3_performance_011_08_wils1406(speeds, time)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program will compare the benchmarks provided to the models 
% and values our algroithm produced. This will test the performance 
% of our main function in accordance with the boundaries provided by 
% CruiseAuto.
%
% Function Call
% [left_speed, right_speed, compact_speed, sedan_speed, suv_speed,...
%  speed1, speed2, speed3, speed4, speed5, speed6, speed7, speed8,...
%  speed9] = M3_performance_011_08_wils1406
%
% Input Arguments
% NONE
%
% Output Arguments
% left_speed
% right_speed
% compact_speed
% sedan_speed
% suv_speed
% speed1-9
%
% Assignment Information
%   Assignment:     M3, Problem 4
%   Team member:    Nia Wilson, wils1406@purdue.edu
%                   Sofia Reid, 
%                   Josh Wallwork, 
%                   Hyunseok Lee, 
%   Team ID:        011-08
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

data = readmatrix('sp24_cruiseAuto_experimental_data.csv');
time = data(:,1);

% Performance Boundaries from Milestone 0
%t = 0:0.1:30;
left_ts = 4.50; % time when acceleration starts - left bound
left_to = 1.25; % time constant - left bound
left_yl = 1.10; % initial speed - left bound
left_yh = 25.80; % final speed - left bound

right_ts = 6.00; % time when acceleration starts - right bound
right_to = 3.90; % time constant - right bound
right_yl = -0.90; % initial speed - right bound
right_yh = 23.40; % final speed - right bound

% Left Boundary
for index = 1:length(time)
    if time(index) < left_ts
        left_speed(index) = left_yl;
    elseif time(index) >= left_ts
        left_speed(index) = left_yl + (left_yh - left_yl) .*...
            (1 - exp(-((time(index) - left_ts) ./ left_to)));
    end
end

% Right Boundary
for index = 1:length(time)
    if time(index) < right_ts
        right_speed(index) = right_yl;
    elseif time(index) >= right_ts
        right_speed(index) = right_yl + (right_yh - right_yl) .*...
            (1 - exp(-((time(index) - right_ts) ./ right_to)));
    end
end

% Benchmarking Parameters
compact_accell = 6.80;
compact_constant = 1.50;
compact_initial = 0.24;
compact_final = 25.00;

sedan_accell = 6.77;
sedan_constant = 1.97;
sedan_initial = 0.24;
sedan_final = 24.90;

suv_accell = 5.55;
suv_constant = 2.86;
suv_initial = -0.11;
suv_final = 24.20;

% Benchmark for Compact Hatchback
for index = 1:length(time)
    if time(index) < compact_accell
        compact_speed(index) = compact_initial;
    elseif time(index) >= compact_accell
        compact_speed(index) = compact_initial + (compact_final - compact_initial) .*...
            (1 - exp(-((time(index) - compact_accell) ./ compact_constant)));
    end
end

% Benchmark for Midsize Four Door Sedan
for index = 1:length(time)
    if time(index) < sedan_accell
        sedan_speed(index) = sedan_initial;
    elseif time(index) >= sedan_accell
        sedan_speed(index) = sedan_initial + (sedan_final - sedan_initial) .*...
            (1 - exp(-((time(index) - sedan_accell) ./ sedan_constant)));
    end
end

% Benchmark for Midsize SUV
for index = 1:length(time)
    if time(index) < suv_accell
        suv_speed(index) = suv_initial;
    elseif time(index) >= suv_accell
        suv_speed(index) = suv_initial + (suv_final - suv_initial) .*...
            (1 - exp(-((time(index) - suv_accell) ./ suv_constant)));
    end
end





%% ____________________
%% CALCULATIONS

load("sub4_results.mat");

%load("startTimesAndConstants.mat");

M3_sub4_011_08_lee4005(cleanedDataCellArray, startTimesAndConstants);
%M3_sub3_011_08_jwallwor("clean_data.csv");

results = readmatrix("initialntimeconstant.csv");

%%accell_start = results().InitialTime;      % Initial time from subfunction 3
%%time_constant = results().TimeConstant;    % Time constant from subfunction 3
%%initial_speed = sub4_results().initialSpeed; % Initial speed from subfunction 4
%%final_speed = sub4_results().finalSpeed;    % Final speed from subfunction 4

% Compact Hatchback - Summer Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(1,1)
        speed1(index) = sub4_results(1).initialSpeed;
      elseif time(index) >= results(1,1)
        speed1(index) = sub4_results(1).initialSpeed + (sub4_results(1).finalSpeed - sub4_results(1).initialSpeed) .*...
            (1 - exp(-((time(index) - results(1,1)) ./ results(1,2))));
      end
   end

% Compact Hatchback - All-Season Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(2,1)
        speed2(index) = sub4_results(2).initialSpeed;
      elseif time(index) >= results(2,1)
        speed2(index) = sub4_results(2).initialSpeed + (sub4_results(2).finalSpeed - sub4_results(2).initialSpeed) .*...
            (1 - exp(-((time(index) - results(2,1)) ./ results(2,2))));
      end
   end

% Compact Hatchback - Winter Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(3,1)
        speed3(index) = sub4_results(3).initialSpeed;
      elseif time(index) >= results(3,1)
        speed3(index) = sub4_results(3).initialSpeed + (sub4_results(3).finalSpeed - sub4_results(3).initialSpeed) .*...
            (1 - exp(-((time(index) - results(3,1)) ./ results(3,2))));
      end
   end

% Midsize Four Door Sedan - Summer Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(4,1)
        speed4(index) = sub4_results(4).initialSpeed;
      elseif time(index) >= results(4,1)
        speed4(index) = sub4_results(4).initialSpeed + (sub4_results(4).finalSpeed - sub4_results(4).initialSpeed) .*...
            (1 - exp(-((time(index) - results(4,1)) ./ results(4,2))));
      end
   end

% Midsize Four Door Sedan - All-Season Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(5,1)
        speed5(index) = sub4_results(5).initialSpeed;
      elseif time(index) >= results(5,1)
        speed5(index) = sub4_results(5).initialSpeed + (sub4_results(5).finalSpeed - sub4_results(5).initialSpeed) .*...
            (1 - exp(-((time(index) - results(5,1)) ./ results(5,2))));
      end
   end

% Midsize Four Door Sedan - Winter Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(6,1)
        speed6(index) = sub4_results(6).initialSpeed;
      elseif time(index) >= results(6,1)
        speed6(index) = sub4_results(6).initialSpeed + (sub4_results(6).finalSpeed - sub4_results(6).initialSpeed) .*...
            (1 - exp(-((time(index) - results(6,1)) ./ results(6,2))));
      end
   end

% Midsize SUV - Summer Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(7,1)
        speed7(index) = sub4_results(7).initialSpeed;
      elseif time(index) >= results(7,1)
        speed7(index) = sub4_results(7).initialSpeed + (sub4_results(7).finalSpeed - sub4_results(7).initialSpeed) .*...
            (1 - exp(-((time(index) - results(7,1)) ./ results(7,2))));
      end
   end

% Midsize SUV - All-Season Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(8,1)
        speed8(index) = sub4_results(8).initialSpeed;
      elseif time(index) >= results(8,1)
        speed8(index) = sub4_results(8).initialSpeed + (sub4_results(8).finalSpeed - sub4_results(8).initialSpeed) .*...
            (1 - exp(-((time(index) - results(8,1)) ./ results(8,2))));
      end
   end

% Midsize SUV - Winter Tires: piecewise
   for index = 1:length(time)
      if time(index) < results(9,1)
        speed9(index) = sub4_results(9).initialSpeed;
      elseif time(index) >= results(9,1)
        speed9(index) = sub4_results(9).initialSpeed + (sub4_results(9).finalSpeed - sub4_results(9).initialSpeed) .*...
            (1 - exp(-((time(index) - results(9,1)) ./ results(9,2))));
      end
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


