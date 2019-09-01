function question3()
    % Part A -----------------------------------------------
    t_length=6
    dt=0.01
    u1 = indicator(1,3,t_length,dt)
    u2 = indicator(2,4,t_length,dt)
    u = 2*u1 + (-3)*u2
    v1 = indicator(-1,2,t_length,dt)
    v2 = indicator(0,1,t_length,dt)
    v = v1 + 2*v2
    s = u + j*v
    [X, f, dt1] = contFT(s,-t_length,dt,1)
    smf = conj(fliplr(s))
    figure(13,"position",[0,0,1800,1000])    
    plot(f,abs(X))
    grid on
    title('Plot of magnitude of Fourier Transform of s(t)')
    xlabel('frequency (Hz)')
    ylabel('|Xs(f)|')
    pause;

    % Part B -------------------------------------------------
    [conv_s, t] = contconv(s,smf,-t_length,-t_length,dt)
    [X1, f1, dt2] = contFT(conv_s,t(1),dt,1)
    figure(14,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(f1, abs(X1));
    grid on
    title('Plot of Fourier Transform of convolution of s and smf')
    xlabel('frequecy (Hz)')
    ylabel('|Xs*Xsmf|')
    xlim([-10 10]);
    subplot(2,1,2)
    plot(f, abs(X).^2);
    grid on
    title('Plot of square of magnitude of, Fourier Transform of s')
    xlabel('frequecy (Hz)')
    ylabel('|Xs(f)|^2')
    xlim([-10 10]);
    pause;

    % Part C -------------------------------------------------
    figure(15,"position",[0,0,1800,1000])
    plot(f1, angle(X1));
    grid on
    title('Plot of Phase of Fourier Transform of convolution of s and smf')
    xlabel('frequecy (Hz)')
    ylabel('angle[Xs*Xsmf]')
    pause;

end