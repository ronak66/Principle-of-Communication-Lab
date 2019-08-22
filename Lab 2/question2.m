function question2()
    dt = (1/(16))
    t = -8:dt:8
    s = 3*arrayfun(@sinc, 2*t-3)
    [X, f, dt] = contFT(s,-8,dt,0.001)
    figure(11,"position",get(0,"screensize"))
    plot(f, abs(X));
    grid on
    pause;
    figure(12,"position",get(0,"screensize"))
    plot(f, angle(X));
    grid on
    pause;
end
