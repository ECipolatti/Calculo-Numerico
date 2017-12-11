function [P,L,U] = gauss2_lu(A)
    [m,n] = size(A);
    tol = 1e-9;
    indx = [1:n];
    
    for k = 1 : n-1
        aux = [k:n];
        
        [max_pivot,indxmax] = max(abs(A(indx(aux),k)));
        
        % control de pivot
        if(max_pivot < tol)
            disp('No se puede seguir con el algoritmo');
            return;
        end
        
        % hago intercambio
        if(indx(k) ~= indx(aux(indxmax)))
            m = indx(k);
            indx(k) = indx(aux(indxmax));
            indx(aux(indxmax)) = m;
        end
        
        % calculo multiplicadores
        A(indx(k+1:n),k) = A(indx(k+1:n),k) / A(indx(k),k);
        
        % eliminación
        for j = k+1:n
            A(indx(k+1:n),j) = A(indx(k+1:n),j) - A(indx(k+1:n),k) * A(indx(k),j);
        end

    end
    I = eye(n,n); % Crea la matriz identidad de nxn
    P = I(indx,:); % Crea la matriz de permutación obtenida por pivoteo
    [L,U] = lu_sep(P*A); % lu_sep separa una matriz cualquiera en U y L 
end