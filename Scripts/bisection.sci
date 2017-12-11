function [p,h] = bisection(f,a,b,nmax,tol)
    h = []; // histórico de convergencia |f(p_n)| < tol
    fa = f(a);
    fb = f(b);
    
    if (abs(fa) < tol) then
        disp("La raíz es a");
        p = a;
        return;
    end
    if (abs(fb) < tol) then
        disp("La raíz es b");
        p = b;
        return;
    end
    
    if(sign(fa) * sign(fb) > 0) then
        disp("El intervalo inicial no es válido para el método");
        return;
    end
    
    n = 1; // me gusta más n = 0;
    
    while (n <= nmax)
        p = a + (b - a) / 2;
        fp = f(p);
        if(sign(fp) * sign(fa) > 0) then
            a = p;
        else
            b = p;
        end
        
        crit = abs(fp);
        h = [h,crit];
        
        if (crit < tol) then
            return;
        end
        n = n + 1;
    end // end while
    
endfunction
