function [p,h] = bisection(a,b,nmax,tol)
    %Crear la funcion en el archivo f
    h = []; %// hist√≥rico de convergencia |f(p_n)| < tol
    fa = feval(@f,a);
    fb = feval(@f,b);
    
    if (abs(fa) < tol) 
        disp('La raÌz es a');
        p = a;
        return;
    end
    if (abs(fb) < tol) 
        disp('La raÌz es b');
        p = b;
        return;
    end
    
    if(sign(fa) * sign(fb) > 0) 
        disp('El intervalo inicial no es v·lido para el mÈtodo');
        return;
    end
    
    n = 1; %// me gusta m√°s n = 0;
    
    while (n <= nmax)
        p = a + (b - a) / 2;
        fp = feval(@f,p);
        if(sign(fp) * sign(fa) > 0) 
            a = p;
        else
            b = p;
        end
        
        crit = abs(fp);
        h = [h,crit];
        
        if (crit < tol) 
            return;
        end
        n = n + 1;
    end %// end while
end