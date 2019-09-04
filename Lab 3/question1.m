function question1()

    t_length = 5
    dt = 0.001
    t = -t_length:dt:t_length

    % Part 1.1 ------------------------------------------------------------------------------------------------------------------------
    p = indicator(0,1,t_length,dt)
    bc = clock_signal(dt,t_length,1)
    [uc, tc] = contconv(p,bc,-t_length,-t_length,dt)
    bs = clock_signal(dt,t_length,-1)
    [us, ts] = contconv(p,bs,-t_length,-t_length,dt)
    uc = transpose(uc)
    us = transpose(us)
    figure(1,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    title('Plot of signal Uc(t)')
    xlabel('time(s)')
    ylabel('Uc(t)')
    grid on
    subplot(2,1,2)
    plot(ts,us)
    title('Plot of signal Us(t)')
    xlabel('time(s)')
    ylabel('Us(t)')
    grid on
    print( 'fig1.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;

    % Part 1.2 ------------------------------------------------------------------------------------------------------------------------
    up1 = (uc).*cos(40*pi*tc)
    [X, f, dt2] = contFT(up1,tc(1),dt,0.01)
    [X1, f1, dt1] = contFT(uc,tc(1),dt,0.01)
    % figure(2,"position",[0,0,1800,1000])
    % subplot(3,1,1)
    % plot(f1,X1)
    % subplot(3,1,2)
    % plot(f,X)
    % subplot(3,1,3)
    % plot(tc,up1)
    % pause;
    figure(2,"position",[0,0,1800,1000])
    plot(tc,up1)
    title('Plot of signal Up1(t)')
    xlabel('time(s)')
    ylabel('Up1(t)')
    grid on
    print( 'fig2.png', '-dpngcairo','-S1800,1000', '-color' )

    up2 = (us).*sin(40*pi*ts)
    % [X, f, dt2] = contFT(up2,ts(1),dt,0.01)
    % [X1, f1, dt1] = contFT(us,ts(1),dt,0.01)
    % subplot(4,1,3)
    % plot(f1,X1)
    % subplot(4,1,4)
    % plot(f,X)
    % pause;

    % Part 1.3 ------------------------------------------------------------------------------------------------------------------------
    up = up1-up2
    figure(3,"position",[0,0,1800,1000])
    plot(tc,up)
    title('Plot of signal Up(t) = Up1 - Up2')
    xlabel('time(s)')
    ylabel('Up(t)')
    grid on
    print( 'fig3.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;
    
    % Part 1.4 ------------------------------------------------------------------------------------------------------------------------
    h = indicator(0,0.25,10,dt)
    updc = up.*cos(40*pi*tc)
    [vc_without_theta,td] = contconv(updc,h,-10,-10,dt)
    % vc_without_theta = vc_without_theta/(100*dt)
    disp(size(h))
    disp(size(updc))
    figure(4,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    title('Plot of signal Uc(t)')
    xlabel('time(s)')
    ylabel('Uc(t)')
    grid on
    subplot(2,1,2)
    plot(td,vc_without_theta/100)
    title('Plot of signal Vc(t) with theta = 0')
    xlabel('time(s)')
    ylabel('Vc(t)')
    grid on
    xlim([-10 10]);
    % graphics_toolkit gnuplot 
    print( 'fig4.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;

    upds = -1*up.*sin(40*pi*ts)
    [vs_without_theta,td1] = contconv(upds,h,-10,-10,dt)
    % vs_without_theta = vs_without_theta/(100*dt)
    disp(size(h))
    disp(size(upds))
    figure(5,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(ts,us)
    title('Plot of signal Us(t)')
    xlabel('time(s)')
    ylabel('Us(t)')
    grid on
    subplot(2,1,2)
    plot(td1,vs_without_theta/100)
    title('Plot of signal Vs(t) with theta = 0')
    xlabel('time(s)')
    ylabel('Vs(t)')
    grid on
    xlim([-10 10]);
    print( 'fig5.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;

    % Part 1.5 ------------------------------------------------------------------------------------------------------------------------
    h = indicator(0,0.25,10,dt)
    updc = up.*cos(40*pi*tc + pi/4)
    [vc_with_theta,td] = contconv(updc,h,-10,-10,dt)
    % vc_with_theta = vc_with_theta/dt
    disp(size(h))
    disp(size(updc))
    figure(6,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    title('Plot of signal Uc(t)')
    xlabel('time(s)')
    ylabel('Uc(t)')
    grid on
    subplot(2,1,2)
    plot(td,vc_with_theta)
    title('Plot of signal Vc(t) with theta = pi/4')
    xlabel('time(s)')
    ylabel('Vc(t)')
    grid on
    xlim([-10 10]);
    print( 'fig6.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;

    upds = -1*up.*sin(40*pi*ts + pi/4)
    [vs_with_theta,td1] = contconv(upds,h,-10,-10,dt)
    % vs_with_theta = vs_with_theta/(100*dt)
    disp(size(h))
    disp(size(upds))
    figure(7,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(ts,us)
    title('Plot of signal Us(t)')
    xlabel('time(s)')
    ylabel('Us(t)')
    grid on
    subplot(2,1,2)
    plot(td1,vs_with_theta/100)
    title('Plot of signal Vs(t) with theta = pi/4')
    xlabel('time(s)')
    ylabel('Vs(t)')
    grid on
    xlim([-10 10]);
    print( 'fig7.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;

    % Part 1.6 ------------------------------------------------------------------------------------------------------------------------
    uc_convex_envolope = vc_with_theta.*cos(pi/4) - vs_with_theta.*sin(pi/4)
    figure(8,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    title('Plot of signal Uc(t)')
    xlabel('time(s)')
    ylabel('Uc(t)')
    grid on
    subplot(2,1,2)
    plot(td,uc_convex_envolope/100)
    title('Plot of signal Vc(t) with theta using convex envolope')
    xlabel('time(s)')
    ylabel('Vc(t)')
    grid on
    xlim([-10 10]);
    print( 'fig8.png', '-dpngcairo','-S1800,1000', '-color' )

    us_convex_envolope = vc_with_theta.*cos(pi/4) + vs_with_theta.*sin(pi/4)
    figure(9,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(ts,us)
    title('Plot of signal Us(t)')
    xlabel('time(s)')
    ylabel('Us(t)')
    grid on
    subplot(2,1,2)
    plot(td,us_convex_envolope/100)
    title('Plot of signal Vs(t) with theta using convex envolope')
    xlabel('time(s)')
    ylabel('Vs(t)')
    grid on
    xlim([-10 10]);
    print( 'fig9.png', '-dpngcairo','-S1800,1000', '-color' )
    % pause;
end