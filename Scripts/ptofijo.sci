// Para poder usar la función hay que crear la g(x):
// function y = mig1(x)
//      y = ............;
// endfunction
// mig1,sci


function [p,h] = ptofijo(g,p,nmax,tol)
    h = [];
    n = 1;
    
    while (n < nmax)
        pold = p;
        p = g(p);
        
        crit = abs(pold-p);
        h = [h,crit];
        if (crit < tol) then
            disp("Se encontró la raíz");
            return;
        end
        n = n + 1;
    end
endfunction
