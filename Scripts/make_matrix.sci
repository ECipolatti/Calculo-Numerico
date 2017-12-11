function [A,b,x0] = make_matrix(n)
    if n < 5 then
        disp("Dimensión de la matriz inadecuada (ingresar n > 4)");
        return;
    end
    
    A = zeros(n,n);
    b = %pi * ones(n,1);
    x0 = zeros(n,1);

    for i = 1 : n
        A(i,i) = 2 * i;
        for j = 1 : n
            if ((j == i-2) | (j == i+2)) then
                A(i,j) = 0.5 * i;
            end
            if ((j == i-4) | (j == i+4)) then
                A(i,j) = 0.25 * i;
            end
        end
    end

endfunction
