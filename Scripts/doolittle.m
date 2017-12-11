function [L,U]=doolittle(A) 
    %creo las matrices
    L = zeros(size(A));
    U = zeros(size(A));
    [m,n] = size(A);
    
    % Recorremos en orden de columnas
    for i=1:n
      for j=1:m
    % Estamos arriba de la diagonal buscamos U
        if i<=j
              U(i,j) = A(i,j);
              for k=1:i-1
                U(i,j) = U(i,j) - L(i,k)*U(k,j);
              end
        end    
    % Estamos abajo de la diagonal buscamos L
        if j<=i
            L(i,j) = A(i,j);
         for k=1:j-1
            L(i,j) = L(i,j) - L(i,k)*U(k,j);
          end
          L(i,j) = L(i,j)/U(j,j);
        end
      end
    end
end