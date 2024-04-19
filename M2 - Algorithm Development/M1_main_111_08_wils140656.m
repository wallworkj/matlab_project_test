function M1_main_111_08_wils1406
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program will retrieve the data and assign the data to 
% different variables. The data will also be plotted. 
%
% Function Call
% M1_main_111_08_wils1406
%
% Input Arguments
% NONE
%
% Output Arguments
% NONE
%
% Assignment Information
%   Assignment:     M1, Problem 1
%   Team member:    Nia Wilson, wils1406@purdue.edu
%                   Sofia Reid
%                   Josh Wallwork
%                   Hyunseok Lee
%   Team ID:        111-08
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

data = readmatrix("sp24_cruiseAuto_experimental_data.csv");
disp(data(:,2:6))
time = data(:,1);
compact_summer = data(:,2:6);
compact_allSeason = data(:,7:11);
compact_winter = data(:,12:16);
sedan_summer = data(:,17:21);
sedan_allSeason = data(:,22:26);
sedan_winter = data(:,27:31);
suv_summer = data(:,32:36);
suv_allSeason = data(:,37:41);
suv_winter = data(:,42:46);

%% ____________________
%% CALCULATIONS


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure(1)
plot(time, compact_summer, 'b-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')
title('Different Tire Tests on the Compact Hatchback')
grid on

hold on

plot(time, compact_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

hold on

plot(time, compact_winter, 'g-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

legend("Summer Tires (blue)", "All Season Tires (red)", "Winter Tires (green)", "Location", "southeast")

hold off


figure(2)

plot(time, sedan_summer, 'b-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')
title('Different Tire Tests on the Midsize Four-Door Sedan')
grid on

hold on

plot(time, sedan_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

hold on

plot(time, sedan_winter, 'g-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

legend("Summer Tires (blue)", "All Season Tires (red)", "Winter Tires (green)", "Location", "southeast")

hold off


figure(3)

plot(time, suv_summer, 'b-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')
title('Different Tire Tests on the Midsize SUV')
grid on

hold on

plot(time, suv_allSeason, 'r-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

hold on

plot(time, suv_winter, 'g-')
xlabel("Time [seconds]")
ylabel('Speed [meters/second]')

legend("Summer Tires (blue)", "All Season Tires (red)", "Winter Tires (green)", "Location", "southeast")

hold off


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



