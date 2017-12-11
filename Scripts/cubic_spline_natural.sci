function[a,b,c,d]=cubic_spline_natural(x,f)
    n= length(x);
    h= x(2:n)-x(1:n-1);
    A = zeros(n,n);
    rhs = zeros(n,1);
    A(1,1) = 1;
    A(n,n) = 1;
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
    
