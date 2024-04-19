% Speed vector for piecewise graph for Campact Hatchback Summer Tires
for index = 1:5001
    if time(index) < times(1,1) % future note: time(index) may return an error)
        speed1(index) = initial_speed;
    elseif time(index) >= times(1,1)
        speed1(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(1,2))));
    end
end

% Speed vector for piecewise graph for Campact Hatchback All-Season Tires
for index = 1:length(time)
    if time(index) < times(2,1)
        speed2(index) = initial_speed;
    elseif time(index) >= times(2,1)
        speed2(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(2,2))));
    end
end

% Speed vector for piecewise graph for Campact Hatchback Winter Tires
for index = 1:length(time)
    if time(index) < times(3,1)
        speed3(index) = initial_speed;
    elseif time(index) >= times(3,1)
        speed3(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(3,2))));
    end
end

% Speed vector for piecewise graph for Midsize Four Door Sedan Summer Tires
for index = 1:length(time)
    if time(index) < times(4,1)
        speed4(index) = initial_speed;
    elseif time(index) >= times(4,1)
        speed4(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(4,2))));
    end
end

% Speed vector for piecewise graph for Midsize Four Door Sedan All-Season Tires
for index = 1:length(time)
    if time(index) < times(5,1)
        speed5(index) = initial_speed;
    elseif time(index) >= times(5,1)
        speed5(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(5,2))));
    end
end

% Speed vector for piecewise graph for Midsize Four Door Sedan Winter Tires
for index = 1:length(time)
    if time(index) < times(6,1)
        speed6(index) = initial_speed;
    elseif time(index) >= times(6,1)
        speed6(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(6,2))));
    end
end

% Speed vector for piecewise graph for Midsize SUV Summer Tires
for index = 1:length(time)
    if time(index) < times(7,1)
        speed7(index) = initial_speed;
    elseif time(index) >= times(7,1)
        speed7(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(7,2))));
    end
end

% Speed vector for piecewise graph for Midsize SUV All-Season Tires
for index = 1:length(time)
    if time(index) < times(8,1)
        speed8(index) = initial_speed;
    elseif time(index) >= times(8,1)
        speed8(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(8,2))));
    end
end

% Speed vector for piecewise graph for Midsize SUV Winter Tires
for index = 1:length(time)
    if time(index) < times(9,1)
        speed9(index) = initial_speed;
    elseif time(index) >= times(9,1)
        speed9(index) = initial_speed + (final_speed - initial_speed) .*...
            (1 - exp(-((time(index) - accell_start) ./ times(9,2))));
    end
end


figure(4)

plot(time, speed1, 'g-')
title("Speed Data for the Compact Hatchback")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on

hold on

plot(time, speed2, 'r-')

hold on

plot(time, speed3, 'b-')

legend("Summer Tires (green)", "All-Season Tires (red)", "Winter Tires (blue)", "Location", "southeast")


figure(5)

plot(time, speed4, 'g-')
title("Speed Data for the Midsize Four-Door Sedan")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on

hold on

plot(time, speed5, 'r-')

hold on

plot(time, speed6, 'b-')

legend("Summer Tires (green)", "All-Season Tires (red)", "Winter Tires (blue)", "Location", "southeast")


figure(6)

plot(time, speed7, 'g-')
title("Speed Data for the Midsize SUV")
xlabel("Time [seconds]")
ylabel('Speed [meters per second]')
grid on

hold on

plot(time, speed8, 'r-')

hold on

plot(time, speed9, 'b-')

legend("Summer Tires (green)", "All-Season Tires (red)", "Winter Tires (blue)", "Location", "southeast")
