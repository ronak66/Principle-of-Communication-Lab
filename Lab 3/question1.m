function question1()

    t_length = 5
    dt = 0.01
    t = -t_length:dt:t_length

    % Part 1.1 -------------------------------------------------------------------
    p = indicator(0,1,t_length,dt)
    bc = clock_signal(dt,t_length,1)
    [uc, tc] = contconv(p,bc,-t_length,-t_length,dt)
    bs = clock_signal(dt,t_length,-1)
    [us, ts] = contconv(p,bs,-t_length,-t_length,dt)
    uc = transpose(uc)
    us = transpose(us)
    subplot(2,1,1)
    plot(tc,uc)
    subplot(2,1,2)
    plot(ts,us)
    pause;

    % Part 1.2 -------------------------------------------------------------------
    up1 = (uc/dt).*cos(40*pi*tc)
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
    

    up2 = (us/dt).*sin(40*pi*ts)
    % [X, f, dt2] = contFT(up2,ts(1),dt,0.01)
    % [X1, f1, dt1] = contFT(us,ts(1),dt,0.01)
    % subplot(4,1,3)
    % plot(f1,X1)
    % subplot(4,1,4)
    % plot(f,X)
    % pause;

    % Part 1.3 -------------------------------------------------------------------
    up = up1-up2
    
    % Part 1.4 -------------------------------------------------------------------
    h = indicator(0,0.25,10,dt)
    updc = up.*cos(40*pi*tc)
    [updc1,td] = contconv(updc,h,-10,-10,dt)
    disp(size(h))
    disp(size(updc))
    figure(3,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    grid on
    subplot(2,1,2)
    plot(td,updc1)
    grid minor
    xlim([-10 10]);
    % graphics_toolkit gnuplot 
    print( 'test.png', '-dpngcairo','-S1800,1000', '-color' )
    pause;

    upds = -1*up.*sin(40*pi*ts)
    [upds1,td1] = contconv(upds,h,-10,-10,dt)
    disp(size(h))
    disp(size(upds))
    figure(4,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(ts,us)
    subplot(2,1,2)
    plot(td1,upds1)
    xlim([-10 10]);
    pause;

    % Part 1.5 -------------------------------------------------------------------
    h = indicator(0,0.25,10,dt)
    updc = up.*cos(40*pi*tc + pi/4)
    [updc1,td] = contconv(updc,h,-10,-10,dt)
    disp(size(h))
    disp(size(updc))
    figure(5,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(tc,uc)
    subplot(2,1,2)
    plot(td,updc1./cos(pi/4))
    xlim([-10 10]);
    pause;

    upds = -1*up.*sin(40*pi*ts + pi/4)
    [upds1,td1] = contconv(upds,h,-10,-10,dt)
    disp(size(h))
    disp(size(upds))
    figure(6,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(ts,us)
    subplot(2,1,2)
    plot(td1,upds1)
    xlim([-10 10]);
    pause;

end