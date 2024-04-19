data = [0, 9, 4, 5, NaN, 6, NaN];
disp(size(data))

data(isnan(data)) = [];

disp(data)
disp(size(data))