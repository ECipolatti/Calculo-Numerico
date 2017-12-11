function [] = log_plot(rh,tit)
    [m,n] = size(rh);
    iter = [1:n];
    
    scf(5);
    clf(5);
    plot2d("nl",iter,rh,style=2);   // "nl" --> normal x, logarítmica y; style: color de la linea
    p = get("hdl");
    p.children.mark_mode = "on";
    p.children.mark_style = 9;      // tipo de punto
    p.children.thickness = 3;       // grosor
    p.children.mark_foreground = 2; // color del punto
    xtitle(tit, "iteraciones", "log(residuo)");     // titulo, eje x, eje y
    set(gca(), "grid", [-1,1]);
endfunction
