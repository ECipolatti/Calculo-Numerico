function [x] = backsub2(U,b,indx)
    [m,n] = size(U);
    
    U1 = zeros(n,n);
    b1 = zeros(n,1);
    
    for i = 1 : n
        U1(i,:) = U(indx(i),:);
        b1(i) = b(indx(i));
    end
    
    tol = 1e-9;
    x = zeros(n,1); %// vector columna de nx1 ceros
    
    if(abs(U1(n,n)) < tol) %// si Unn es muy chico
        disp('No se puede continuar con el algoritmo');
        return;
    end
    
    x(n) = b1(n) / U1(n,n);
    
    for i = n-1: -1 : 1 % para i = n-1 hasta 1 decrementando de a 1
        x(i) = (b1(i) - U1(i,i+1:n) * x(i+1:n)) / U1(i,i);
    end
    
end