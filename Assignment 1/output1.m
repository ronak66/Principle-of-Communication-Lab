% Question 1, B
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t);
plot(t, y);
pause;

% Question 1, C
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t-3);
plot(t, y);
pause;

% Question 1, D
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, 3-t);
plot(t, y);
pause;

% Question 1, E
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t*2);
plot(t, y);
pause;
