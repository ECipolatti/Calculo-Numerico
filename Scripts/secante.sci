function [x,h] = secante(f,x,xplus,kmax,tol)
    h =[];
    k = 1;
    fx = f(x);
    fxp = f(xplus);
    
    if (sign(fx) == sign(fxp)) then
        disp("El intervalo no sirve");
        return;
    end
    
    crit = abs(x - xplus);
    h = [h,crit];
    while (k < kmax)
        fx = f(x);
        fxp = f(xplus);
        df = (fxp - fx)/(xplus - x);
        x = xplus;
        xplus = xplus - fxp/df;
        crit = abs(xplus-x);
        h = [h,crit];
        if (crit < tol) then
            disp("Se encontró la raíz");
            return;
        end
        k = k + 1;
    end
endfunction
