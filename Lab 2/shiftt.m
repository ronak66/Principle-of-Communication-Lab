function y = shiftt(x1,a,dt)
    if(a<0)
        a = -a
        flag = zeros(length(1:dt:a),1)'
        y = x1
        y(length(x1)-length(1:dt:a)+1:1:length(x1))=[]
        y = [flag,y]
    else
        flag = zeros(length(0:dt:a)-1,1)'
        y = x1
        y(1:1:length(0:dt:a)-1)=[]
        y = [y,flag]
    endif
end