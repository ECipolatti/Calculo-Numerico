function [a0,a1,E] = least_squares(x,y)
    [fx,cx] = size(x);
    [fy,cy] = size(y);
    nx = 0; // longitud de x
    ny = 0; // longitud de y
    m = 0;
    a0 = 0;
    a1 = 0;
    
    // Determina la longitud del vector x. También lo convierte a vector fila
    if fx == 1 then
        nx = cx;
        x = x';
    else
        nx = fx;
    end
    
    // Determina la longitud del vector y. También lo convierte a vector fila
    if fy == 1 then
        ny = cy;
        y = y';
    else
        ny = fy;
    end
    
    if nx ~= ny then
        disp("Dimensiones de los datos de entrada inconsistentes.");
        return;
    else
        m = nx;
    end
    
    a0 = (sum(x.^2)*sum(y) - sum(x.*y)*sum(x)) / (m * (sum(x.^2)) - (sum(x))^2);
    a1 = (m*sum(x.*y) - sum(x)*sum(y)) / (m*sum(x.^2) - (sum(x)^2));
    
    P = zeros(m,1);
    P(1:m) = a0 + a1 * x(1:m);
    E = sum((y(1:m) - P(1:m))^2);
    
endfunction
