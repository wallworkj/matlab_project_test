function M2_main_011_08_wils1406copu
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
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

data = readmatrix("sp24_cruiseAuto_experimental_data.csv");

time = data(:,1);

% Function call for the sub function that cleans and manages errors in the
% data
cleandata = M2_sub2_011_08_reid138();

%% ____________________
%% CALCULATIONS

% Function call for the sub function to get the acceleration start time and the time constant

times = M2_subfunction_3_011_08_jwallwor(cleandata);

%% Function call for the sub function to get the initial and final speeds
sub4_results = M2_subfunction_4_011_08_lee4005(filename);


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure(1)

sgtitle("Experimental Speed Data for the Compact Hatchback")

subplot(1,3,1)
plot(time, clean_compact_summer, 'g-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Summer Tires")
grid on

subplot(1,3,2)
plot(time, clean_compact_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("All-Season Tires")
grid on

subplot(1,3,3)
plot(time, clean_compact_winter, "b-")
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Winter Tires")
grid on


figure(2)

sgtitle("Experimental Speed Data for the Midsize Four-Door Sedan")

subplot(1,3,1)
plot(time, clean_sedan_summer, 'g-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Summer Tires")
grid on

subplot(1,3,2)
plot(time, clean_sedan_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("All-Season Tires")
grid on

subplot(1,3,3)
plot(time, clean_sedan_winter, "b-")
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Winter Tires")
grid on


figure(3)

sgtitle("Experimental Speed Data for the Midsize SUV")

subplot(1,3,1)
plot(time, clean_suv_summer, 'g-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Summer Tires")
grid on

subplot(1,3,2)
plot(time, clean_suv_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("All-Season Tires")
grid on

subplot(1,3,3)
plot(time, clean_suv_winter, "b-")
xlabel("Time [seconds]")
ylabel("Speed [meters/second]")
title("Winter Tires")
grid on


%% ____________________
%% RESULTS

fprintf("Results for the Compact Hatchback:\nSummer Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(1,1), times(1,2), initial_speed, final_speed)
fprintf("All-Season Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(2,1),  times(2,2), initial_speed, final_speed)
fprintf("Winter Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n",  times(3,1), times(3,2), initial_speed, final_speed)
fprintf("\nResults for the Midsize Four Door Sedan:\nSummer Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(4,1), times(4,2), initial_speed, final_speed)
fprintf("All-Season Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(5,1), times(5,2), initial_speed, final_speed)
fprintf("Winter Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(6,1), times(6,2), initial_speed, final_speed)
fprintf("\nResults for the Midsize SUV:\nSummer Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(7,1), times(7,2), initial_speed, final_speed)
fprintf("All-Season Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(8,1), times(8,2), initial_speed, final_speed)
fprintf("Winter Tires:\nAcceleration Start Time: %.2f\nTime Constant: %.2f\nInitial Speed: %.2f\nFinal Speed: %.2f\n", times(9,1), times(9,2), initial_speed, final_speed)


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



