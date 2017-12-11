function[a,b,c,d]=cubic_spline_clamped(x,f,df)
    n= length(x);
    h= x(2:n)-x(1:n-1); //Separacion entre dos nodos
    A = zeros(n,n);
    rhs = zeros(n,n); //Es el vector solución, vendria a ser el b de Ax=b
    A(1,1) = 2*h(1);
    A(1,2) = h(1);
    A(n,n-1)=h(n-1);
    A(n,n) = 2*h(n-1);
    rhs(1)=3*(f(2) - f(1)) / h(1) - 3* df(1);
    rhs(n)=3* df(n) - 3*(f(n) - f(n-1)) / h(n-1);
    
    for (i=2:n-1);
        A(i,i-1) = h(i-1);
        A(i,i) = 2*(h(i) + h(i-1));
        A(i,i+1) = h(i);
        rhs(i) = 3*(f(i+1) - f(i)) / h(i) -3*(f(i)-f(i-1))/h(i-1);
    end 
    c = gauss(A,rhs);
    b = (f(2:n)-f(1:n-1))./h(1:n-1)-(2*c(1:n-1)+c(2:n)).*h(1:n-1)/3;
    d = (c(2:n)-c(1:n-1))./(3*h(1:n-1));
    a = f(1:n-1);
    c = c(1:n-1);
endfunction
    
