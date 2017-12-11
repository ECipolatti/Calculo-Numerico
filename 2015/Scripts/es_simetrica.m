function [x]=es_simetrica(A)
    [m,n]=size(A);
    if (m>1) & (m~=n) 
        disp('ERROR: La matriz no es cuadrada');
        x=false;
        return;
    end
    for i=2:n
        for j=1:i-1
            if(A(i,j)~=A(j,i)) 
                disp('ERROR: La matriz no es simétrica');
                x=false;
                return;
            end
        end
    end
    x=true;
end