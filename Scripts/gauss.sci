function [x] = gauss(A,b)
  [m,n] = size(A);
  x = zeros(n);
   
  for k = 1 : n-s1 // desde k = 1 hasta n-1 con incremento de 1
  // calcula los multiplicadores
  A(k+1:n,k) = A(k+1:n,k) / A(k,k);
   
  // eliminación
  for j = k+1 : n // desde j = k+1 hasta n con incremento de 1
  A(k+1:n,j) = A(k+1:n,j) - A(k+1:n,k) * A(k,j);
  end
   
  b(k+1:n) = b(k+1:n) - A(k+1:n,k)*b(k);
  end
   
  x = backsub(A,b);
endfunction
