function [y]=forwardsub(L,b)
    [m,n]=size(L);
    tol = 10^(-9);
    if(L(1,1)<tol)
        disp("No funca el algoritmo")
        return;
    end
    y=zeros(n,1);
    y(1)= (b(1)/L(1,1));
    
    for i=2:n
        if(L(1,1)<tol)
            disp("No funca el algoritmo")
            return;
        end
        y(i)=(b(i)-sum(L(1,1:i-1)*y(1:i-1)))/L(i,i);
    end
endfunction
