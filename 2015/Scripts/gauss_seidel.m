function [x,nit,rh,t] = gauss_seidel(A,b,x0,maxit,tol)
    tic;
    nit = 0;
    [m,n] = size(A);
    r = 1.0;
    rh = [];
    x = x0;
    
    while (r > tol && nit < maxit)
        xold = x;
        
        for i = 1 : n
            % La segunda sumatoria corresponde x de la iteraciÃ³n anterior,
            % pero dado xold = x, es indistinto
            x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*xold(i+1:n)) / A(i,i);
			
        end
        
        r = norm(x-xold, inf) / norm(x, inf);
        rh = [rh,r];
        nit = nit + 1;
        
        if r <= tol 
            disp('Proceso finalizado por tolerancia de error');
            
        end
        
        if nit >= maxit 
            disp('Proceso finalizado por límite de iteraciones');
            
        end
    end
    t =toc;
end

