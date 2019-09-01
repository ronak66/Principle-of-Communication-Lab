function question1()

    % Part a -------------------------------------------
    dt=0.01
    t_length=7
    space = -t_length:dt:t_length
    u1 = indicator(1,3,t_length,dt)
    u2 = indicator(2,4,t_length,dt)
    u = 2*u1 + (-3)*u2
    umf = fliplr(u)
    figure(1,"position",[0,0,1800,1000])
    subplot (2,1,1)
    plot(space,u)
    disp(size(space))
    disp(size(u))
    grid on
    title('Plot of signal u')
    xlabel('time')
    ylabel('u(t)')
    subplot (2,1,2)
    plot(-1*space,u)
    grid on
    title('Plot of signal umf')
    xlabel('time')
    ylabel('x(t)')
    pause;

    % Part b ------------------------------------------
    [conv_y,t] = contconv(u,umf,-t_length,-t_length,dt)
    figure(2,"position",[0,0,1800,1000])
    plot(t,conv_y)
    grid on
    title('Plot of convolution of u and umf')
    xlabel('time')
    ylabel('u(t)*umf(t)')
    pause;

    % Part c ------------------------------------------
    v1 = indicator(-1,2,t_length,dt)
    v2 = indicator(0,1,t_length,dt)
    v = v1 + 2*v2
    s = u + j*v
    smf = conj(fliplr(s))
    figure(3,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(space,real(s))
    grid on
    title('Plot of real part of s = u + jv')
    xlabel('time')
    ylabel('real[s(t)]')
    subplot(2,1,2)
    plot(space,real(smf))
    grid on
    title('Plot of real part of smf = s*(-t)')
    xlabel('time')
    ylabel('real[smf(t)]')
    pause;

    figure(4,"position",[0,0,1800,1000])
    subplot(2,1,1)
    plot(space,imag(s))
    grid on
    title('Plot of imagnary part of s = u + jv')
    xlabel('time')
    ylabel('imag[s(t)]')
    subplot(2,1,2)
    plot(space,imag(smf))
    grid on
    title('Plot of imagnary part of smf = s*(-t)')
    xlabel('time')
    ylabel('imag[smf(t)]')
    pause;


    % Part d -----------------------------------------
    [conv_s, t] = contconv(s,smf,-t_length,-t_length,dt)
    figure(5,"position",[0,0,1800,1000])
    plot(t,real(conv_s))
    grid on
    title('Plot of real part of convolution of s and smf')
    xlabel('time')
    ylabel('real[s(t)*smf(t)]')
    pause;
    figure(6,"position",[0,0,1800,1000])
    plot(t,imag(conv_s))
    grid on
    title('Plot of imagnary part of convolution of s and smf')
    xlabel('time')
    ylabel('imag[s(t)*smf(t)]')
    pause;
    figure(7,"position",[0,0,1800,1000])
    plot(t,abs(conv_s))
    grid on
    title('Plot of magnitude part of convolution of s and smf')
    xlabel('time')
    ylabel('abs[s(t)*smf(t)]')
    pause;

    % Pard e ------------------------------------------
    t0 = 4
    s1 = shiftt(s,-t0,dt)*exp(i*pi/4)
    [y, t] = contconv(smf,s1,-t_length,-t_length,dt)
    figure(8,"position",[0,0,1800,1000])
    plot(t,real(y)) 
    grid on
    title('Plot of real part of convolution of s1 and smf')
    xlabel('time')
    ylabel('real[s1(t)*smf(t)]')
    pause;
    figure(9,"position",[0,0,1800,1000])
    plot(t,imag(y))
    grid on
    title('Plot of imagnary part of convolution of s1 and smf')
    xlabel('time')
    ylabel('imag[s1(t)*smf(t)]')
    pause;
    figure(10,"position",[0,0,1800,1000])
    plot(t,abs(y))
    grid on
    title('Plot of magnitude part of convolution of s1 and smf')
    xlabel('time')
    ylabel('abs[s1(t)*smf(t)]')
    pause;
end