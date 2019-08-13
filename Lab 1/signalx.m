% Question 1, A
function output = signalx(t)
    if(t>=-3 && t<=-1)
        output = 2*(e^(t+1));
    elseif(t>=-1 && t<=4)
        output = 2*(e^(-1*t))*(cos(2*pi*t));
    else
        output = 0;
    endif
endfunction
