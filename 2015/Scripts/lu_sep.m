function [L,U] = lu_sep(A)
    [~,n] = size(A);
    L=eye(n,n);
    U=zeros(n,n);
    
    if n == 1 then
        U = A;
    end
    
    for i=1 : n
        for j=i : n
            U(i,j) = A(i,j);
        end
    end
    for i = 2 : n
        for j = 1 : i-1
            L(i,j) = A(i,j);
        end
    end
end