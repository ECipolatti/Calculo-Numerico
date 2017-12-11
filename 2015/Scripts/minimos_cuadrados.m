function [a0,a1,E] = minimos_cuadrados(x,y)
    [fx,cx] = size(x);
    [fy,cy] = size(y);
    nx = 0; %// longitud de x
    ny = 0; %// longitud de y
    m = 0;
    a0 = 0;
    a1 = 0;
    
    %// Determina la longitud del vector x. 
    if fx == 1 
        nx = cx;
        x = x';
    else
        nx = fx;
    end
    
    %// Determina la longitud del vector y. 
    if fy == 1 
        ny = cy;
        y = y';
    else
        ny = fy;
    end
    
    if nx ~= ny 
        disp('Dimensiones de los datos de entrada inconsistentes.');
        return;
    else
        m = nx;
    end
    
    a0 = (sum(x.^2)*sum(y) - sum(x.*y)*sum(x)) / (m * (sum(x.^2)) - (sum(x))^2);
    a1 = (m*sum(x.*y) - sum(x)*sum(y)) / (m*sum(x.^2) - (sum(x)^2));
    
    P = zeros(m,1);
    P(1:m) = a0 + a1 * x(1:m);
    E = sum((y(1:m) - P(1:m)).^2);
end