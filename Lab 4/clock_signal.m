function y = clock_signal(dt,t,value)
    l = (-t):dt:t
    y = zeros(length(l),1)
    flag = value
    count = 0
    for i = 0:length(0:dt:1)-1:length(y)
        y(i+1) = -1*flag
        % count += 1
        % if count == 2
        %     flag = -1*flag
        %     count = 0
        % endif
        flag = -1*flag
    endfor
end