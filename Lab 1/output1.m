% Question 1, B
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t);
plot(t, y);
grid on
title('Plot of signalx vs t for -6 <= t <= 6')
xlabel('time')
ylabel('x(t)')
pause;

% Question 1, C
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t-3);
plot(t, y);
grid on
title('Plot of x(t-3) vs t for -6 <= t <= 6')
xlabel('time')
ylabel('x(t-3)')
pause;

% Question 1, D
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, 3-t);
plot(t, y);
grid on
title('Plot of x(3-t) vs t for -6 <= t <= 6')
xlabel('time')
ylabel('x(3-t)')
pause;

% Question 1, E
t = [-6 : 0.01: 6];
y = arrayfun(@signalx, t*2);
plot(t, y);
grid on
title('Plot of x(2t) vs t for -6 <= t <= 6')
xlabel('time')
ylabel('x(2t)')
pause;
