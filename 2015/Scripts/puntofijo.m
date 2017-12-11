function [p,h] = puntofijo(p,nmax,tol)
    h = [];
    n = 1;
    
    while (n < nmax)
        pold = p;
        p = feval(@g,p);
        
        crit = abs(pold-p);
        h = [h,crit];
        if (crit < tol) 
            disp('Se encontra la raíz');
            return;
        end
        n = n + 1;
    end
end