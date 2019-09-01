function question2()

    % Part A ----------------------------------------
    dt = (1/(16))
    t = -8:dt:8
    s = 3*arrayfun(@sinc, 2*t-3)
    [X, f, dt] = contFT(s,-8,dt,0.001)
    figure(11,"position",[0,0,1800,1000])
    plot(f, abs(X));
    grid on
    title('Plot of Fourier Transform of s = sinc(2t-3)')
    xlabel('frequcy (MHz)')
    ylabel('Xs(f)')
    pause;

    % Part B ----------------------------------------
    figure(12,"position",[0,0,1800,1000])
    plot(f, angle(X));
    grid on
    title('Plot of Phase of Fourier Transform of s')
    xlabel('frequcy (MHz)')
    ylabel('angle[Xs(f)]')
    pause;
end
