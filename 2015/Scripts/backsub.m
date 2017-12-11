function [x] = backsub(U,b)
	n = length(U(:,1));
	[m,n] = size(U);
	tol = 10^(-9);
	x = zeros(n, 1);
	if(abs(U(n,n)) < tol)
		disp('No se puede seguir con las sust.');
		return;
	end
	x(n) = b(n)/U(n,n);
    for i = n-1: -1 : 1,
            if(abs(U(i,i)) < tol)
                disp('No se puede seguir con las sust.');
                return;
            end
            x(i) = (b(i) - sum(U(i, i+1:n)*x(i+1:n)))/U(i,i);
    end
end