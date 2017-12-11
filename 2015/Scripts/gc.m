function[x_k, k , rh,t]=gc(A,b,x0,max_it,tol)
    tic;
    k=0;
    x_k = x0;
    r_k= b - A * x_k;
    minf = max(abs(r_k)); 
    %minf = norm (r_k, "inf");
    rh = minf;
    v_kp1 = r_k;                               % //primer direccion de busqueda (descenso más rápido)
    while(k <= max_it && minf > tol)
        dot1 = sum(r_k.^2);                     %//calculo el salto (las tres lineas)
        vaux = A * v_kp1;
        dot2 = v_kp1' * vaux;
        t_kp1 = dot1/dot2;                      %// t pelito (cuanto salto)
        x_kp1 = x_k + t_kp1 * vaux;             %//nuevo punto despues del salto
        r_kp1 = r_k - t_kp1 * vaux;             %// Cálculo de la siguiente direccion de busqueda por GC
        s_kp1 = sum(r_kp1.^2)/dot1;
        v_kp1 = r_kp1 + s_kp1 * v_kp1;
        r_k = r_kp1;
        
        minf= max(abs(r_k));
        rh = [rh, minf];
        x_k = x_kp1;
        k = k +1;
        end;
        t=toc;
end