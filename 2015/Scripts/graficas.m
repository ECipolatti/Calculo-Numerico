[A, b, x0] = make_matrix(500);
[x, nit, rh, t] = jacobi(A,b,x0,500,1e-5);
[x, nit, rh2, t] = gauss_seidel(A,b,x0,500,1e-5);
[x, nit, rh3, t] = sor(A,b,x0,500,1e-5, 1.1);
[x_k, k, rh4, t] = gc(A, b, x0, 500, 1e-5);

plot(log10(rh), 'r');
grid on
hold on
plot(log10(rh2), 'g');
grid on
plot(log10(rh3), 'b');
grid on
plot(log10(rh4), 'm');
grid on
legend('Jacobi', 'Gauss-Seidel', 'SOR', 'Gradiente Conjugado');
xlabel('Iteraciones');
ylabel('log(residuo');
title('Matriz de 250x250 elementos');
