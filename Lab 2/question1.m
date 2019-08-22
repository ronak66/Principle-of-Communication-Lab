function question1()

    % Part a -------------------------------------------
    dt=0.01
    t_length=6
    space = -t_length:dt:t_length
    u1 = indicator(1,3,t_length,dt)
    u2 = indicator(2,4,t_length,dt)
    u = 2*u1 + (-3)*u2
    umf = fliplr(u)
    figure(1,"position",get(0,"screensize"))
    subplot (2,1,1)
    plot(space,u)
    grid on
    subplot (2,1,2)
    plot(-1*space,u)
    grid on
    pause;

    % Part b ------------------------------------------
    [conv_y,t] = contconv(u,umf,-t_length,-t_length,dt)
    figure(2,"position",get(0,"screensize"))
    plot(t,conv_y)
    grid on
    pause;

    % Part c ------------------------------------------
    v1 = indicator(-1,2,t_length,dt)
    v2 = indicator(0,1,t_length,dt)
    v = v1 + 2*v2
    s = u + j*v
    smf = conj(fliplr(s))
    figure(3,"position",get(0,"screensize"))
    subplot(2,1,1)
    plot(space,real(s))
    grid on
    subplot(2,1,2)
    plot(space,real(smf))
    grid on
    pause;

    figure(4,"position",get(0,"screensize"))
    subplot(2,1,1)
    plot(space,imag(s))
    grid on
    subplot(2,1,2)
    plot(space,imag(smf))
    grid on
    pause;


    % Part d -----------------------------------------
    [conv_s, t] = contconv(s,smf,-t_length,-t_length,dt)
    figure(5,"position",get(0,"screensize"))
    plot(t,real(conv_s))
    grid on
    pause;
    figure(6,"position",get(0,"screensize"))
    plot(t,imag(conv_s))
    grid on
    pause;
    figure(7,"position",get(0,"screensize"))
    plot(t,abs(conv_s))
    grid on
    pause;

    % Pard e ------------------------------------------
    t0 = 4
    s1 = shiftt(s,-t0,dt)*exp(i*pi/4)
    [y, t] = contconv(smf,s1,-t_length,-t_length,dt)
    figure(8,"position",get(0,"screensize"))
    plot(t,real(y)) 
    grid on
    pause;
    figure(9,"position",get(0,"screensize"))
    plot(t,imag(y))
    grid on
    pause;
    figure(10,"position",get(0,"screensize"))
    plot(t,abs(y))
    grid on
    pause;
end