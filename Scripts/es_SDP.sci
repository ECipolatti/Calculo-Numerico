function y = es_sdp(A)
    [m,n] = size(A);
    
    
    y=es_simetrica(A);
    if y then
        // controla si la matriz es definida positiva
        for i = 1 : n
            if det(A(1:i,1:i)) <= 0 then
                disp("La matriz no es simétrica definida positiva.")
                y = %F;
                return;
            end
        end
        disp("La matriz es Simétrica Definida Positiva");
        y = %T;
    end
    
        
endfunction
