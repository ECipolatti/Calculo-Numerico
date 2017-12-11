function [] = plot_ls(x,y,a0,a1)
    scf(5);
    clf(5);

    P = a0 + a1 * x;
    
    plot(x,y,".");
    
    plot2d("nn",x,P,style=5);
    p1 = get("hdl");
    p1.children.thickness = 3;
   
    
    xtitle("Mínimos Cuadrados", "Peso Promedio (x)", "% de Ocurrencia (P(x))");     // titulo, eje x, eje y
    set(gca(), "grid", [-1,1]);
endfunction
