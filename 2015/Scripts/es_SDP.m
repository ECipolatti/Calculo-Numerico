function y = es_sdp(A)
    [m,n] = size(A);

    y=es_simetrica(A);
    if y ;
        %// controla si la matriz es definida positiva
        for i = 1 : n
            if det(A(1:i,1:i)) <= 0 ;
                disp('La matriz no es simÃ©trica definida positiva.');
                y = false;
                return;
            end
        end
        disp('La matriz es Simétrica Definida Positiva');
        y = true;
    end     
end