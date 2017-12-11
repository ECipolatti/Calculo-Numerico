function [x, nit, rh] = jacobi(A, b, x0, max_it, tol)
    nit = 0;
    [m,n]= size(A);
    r=1.0;
    rh=[];
    x=x0;
    
    while(r>tol & nit < max_it)
        xold = x;
        for i=1:n
            x(i) = (b(i) - A(i,1:i-1) * xold(1:i-1) - A(i,i+1:n) * xold(i+1:n) / A(i,i));
        end
            r = norm(x - xold, "inf") / norm (x, "inf");
            rh = [rh,r];
            nit = nit +1;
    end
    if (r<tol) then
        disp("sale por error menor a la tolerancia");
    else
        disp("sale por cantidad de iteraciones");
    end
    
    disp(nit);
endfunction