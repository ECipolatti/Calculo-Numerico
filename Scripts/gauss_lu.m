function [L,U] = gauss_lu(A)
    [m,n] = size(A);
    
    L = eye(n,n);   % Completa L con la diagonal lii = 1
    U = zeros(n,n); % Matriz U inicialmente llena con ceros
         
    for k = 1 : n-1 % desde k = 1 hasta n-1 con incremento de 1
        % controla que el pivote sea distinto de cero
        if(A(k,k) == 0) 
            disp('no se puede continuar con la factorización');
            return;
        end
        % calcula los multiplicadores
        A(k+1:n,k) = A(k+1:n,k) / A(k,k);
        L(k+1:n,k) = A(k+1:n,k); % El multiplicador se guarda en L
        U(k,k) = A(k,k);         % El pivote se guarda en U
        % eliminaciÃ³n
        for j = k+1 : n % desde j = k+1 hasta n con incremento de 1
            A(k+1:n,j) = A(k+1:n,j) - A(k+1:n,k) * A(k,j);
            U(k,j) = A(k,j);
        end
       
       % si A(n,n) es cero, el sistema tiene infinitas soluciones
       if (A(n,n) == 0) 
           disp('el sistema tiene infinitas soluciones');
       end
       U(n,n) = A(n,n); % El pivote a(n,n)
    end
end