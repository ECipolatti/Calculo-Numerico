function [x]=es_simetrica(A)
    [m,n]=size(A);
    if (m>1) & (m~=n) then
        disp("ERROR: La matriz no es cuadrada");
        x=%F;
        return;
    end
    for i=2:n
        for j=1:i-1
            if(A(i,j)~=A(j,i)) then
                disp("ERROR: La matriz no es simétrica");
                x=%F;
                return;
            end
        end
    end
    x=%T;
endfunction
