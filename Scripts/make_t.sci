function [T,D,L,U,rho] = make_t(A,method,w)
    [m,n] = size(A);
    T = zeros(n,n);
    D = zeros(n,n);
    L = zeros(n,n);
    U = zeros(n,n);
    
    for i = 1 : n
        D(i,i) = A(i,i);
        for j = i + 1 : n 
            U(i,j) = -A(i,j);
            L(j,i) = -A(j,i);
        end
    end
    
    select method
        case 1 then T = inv(D) * (L + U),                   // jacobi
        case 2 then T = inv(D - L) * U,                     // gauss-seidel
        case 3 then T = inv(D - w*L) * ((1-w) * D + w*U),   // SOR
        else T = inv(D) * (L + U),
    end
    rho = norm(T);
   
endfunction
