function [x] = gauss2(A,b)
    [m,n] = size(A);
    tol = 1e-9;
    indx = [1:n];
    
    for k = 1 : n-1
        aux = [k:n];
        
        [max_pivot,indxmax] = max(abs(A(indx(aux),k)));
        
        // control de pivot
        if(max_pivot < tol)
            disp("No se puede seguir con el algoritmo");
            return;
        end
        
        // hago intercambio
        if(indx(k) ~= indx(aux(indxmax)))
            m = indx(k);
            indx(k) = indx(aux(indxmax));
            indx(aux(indxmax)) = m;
        end
        
        // calculo multiplicadores
        A(indx(k+1:n),k) = A(indx(k+1:n),k) / A(indx(k),k);
        
        // eliminación
        for j = k+1:n
            A(indx(k+1:n),j) = A(indx(k+1:n),j) - A(indx(k+1:n),k) * A(indx(k),j);
        end
        
        b(indx(k+1:n)) = b(indx(k+1:n)) - A(indx(k+1:n),k) * b(indx(k));
    end
    
    x = backsub2(A,b,indx);
endfunction
