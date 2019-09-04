% Question 2, B
function [y,t] = contconv(x1,x2,t1,t2,dt)
    t = (t1+t2):dt:(t1+t2+(length(x2)+length(x1)-2)*dt)
    y = conv(x1,x2)
endfunction