function [x,nit,rh]=sor_gs(A,b,x0,maxit,tol,w)
    nit=0;
    [m,n]=size(A);
    r=1.0;
    rh=[];
    x=x0;
    while(r>tol & nit<maxit)
        xold=x;
        for i=1:n
            x(i)= (1-w)*xold(i)+(w/A(i,i))(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*xold(i+1:n))/A(i,i);//esta ultima xold tmb se puede poner x, xq los valores de 1+1:n todavia no los toque y siguen siendo los valores viejos.
        end
        r=norm(x-xold,"inf")/norm(x,"inf");
        rh=[rh,r];
        nit=nit +1;
    end
endfunction
