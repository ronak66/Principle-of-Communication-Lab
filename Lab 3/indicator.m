function y = indicator(t1,t2,t,dt)
    s1 = -t:dt:t1-dt
    s2 = t1:dt:t2
    s3 = t2+dt:dt:t
    y = [zeros(length(s1),1)',ones(length(s2),1)',zeros(length(s3),1)']
end