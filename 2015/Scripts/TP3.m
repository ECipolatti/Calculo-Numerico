[A250,b250,x0250] = make_matrix(250);
[A500,b500,x0500] = make_matrix(500);
[A1000,b1000,x01000] = make_matrix(1000);

[T21,D21,L21,U21,rho21] = make_t(A250,1,0.9);
[T22,D22,L22,U22,rho22] = make_t(A250,2,0.9);
[T23,D23,L23,U23,rho23] = make_t(A250,3,0.9);
[T51,D51,L51,U51,rho51] = make_t(A500,1,0.9);
[T52,D52,L52,U52,rho52] = make_t(A500,2,0.9);
[T53,D53,L53,U53,rho53] = make_t(A500,3,0.9);
[T11,D11,L11,U11,rho11] = make_t(A1000,1,0.9);
[T12,D12,L12,U12,rho12] = make_t(A1000,2,0.9);
[T13,D13,L13,U13,rho13] = make_t(A1000,3,0.9);

[x2j, nit2j, rh2j,t2j] = jacobi(A250, b250, x0250, 1000, 10e-5);
[x5j, nit5j, rh5j,t5j] = jacobi(A500, b500, x0500, 1000, 10e-5);
[x1j, nit1j, rh1j,t1j] = jacobi(A1000, b1000, x01000, 1000, 10e-5);

[x2g, nit2g, rh2g,t2g] = gauss_seidel(A250, b250, x0250, 1000, 10e-5);
[x5g, nit5g, rh5g,t5g] = gauss_seidel(A500, b500, x0500, 1000, 10e-5);
[x1g, nit1g, rh1g,t1g] = gauss_seidel(A1000, b1000, x01000, 1000, 10e-5);

[x2s, nit2s, rh2s,t2s] = sor_gs(A250, b250, x0250, 1000, 10e-5, 0.9);
[x5s, nit5s, rh5s,t5s] = sor_gs(A500, b500, x0500, 1000, 10e-5, 0.9);
[x1s, nit1s, rh1s,t1s] = sor_gs(A1000, b1000, x01000, 1000, 10e-5, 0.9);

[x_k250, k250 , rh2gc,t2gc]=gc(A250,b250,x0250,1000,10e-5);
[x_k500, k500 , rh5gc,t5gc]=gc(A500,b500,x0500,1000,10e-5);
[x_k1000, k1000 , rh1gc,t1gc]=gc(A1000,b1000,x01000,1000,10e-5);

%GRAFICAS------------------
figure(1)
hold on;
plot(log10(rh2j),'r');
hold on;
plot(log10(rh2g),'b');
hold on;
plot(log10(rh2s),'g');
hold on;
plot(log10(rh2gc),'k');
legend('Jacobi', 'Gauss-Seidel', 'SOR', 'Gradiente Conjugado');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 250x250 elementos');
figure(4)
hold on;
plot(log10(rh2j),'r');
hold on;
plot(log10(rh2g),'b');
hold on;
plot(log10(rh2s),'g');
legend('Jacobi', 'Gauss-Seidel', 'SOR');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 250x250 elementos');

figure(2)

hold on;
plot(log10(rh5j),'r');
hold on;
plot(log10(rh5g),'b');
hold on;
plot(log10(rh5s),'g');
hold on;
plot(log10(rh5gc),'k');
legend('Jacobi', 'Gauss-Seidel', 'SOR', 'Gradiente Conjugado');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 500x500 elementos');
figure(5)
hold on;
plot(log10(rh5j),'r');
hold on;
plot(log10(rh5g),'b');
hold on;
plot(log10(rh5s),'g');
legend('Jacobi', 'Gauss-Seidel', 'SOR');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 500x500 elementos');


figure(3)

hold on;
plot(log10(rh1j),'r');
hold on;
plot(log10(rh1g),'b');
hold on;
plot(log10(rh1s),'g');
hold on;
plot(log10(rh1gc),'k');
legend('Jacobi', 'Gauss-Seidel', 'SOR', 'Gradiente Conjugado');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 1000x1000 elementos');
figure(6)
hold on;
plot(log10(rh1j),'r');
hold on;
plot(log10(rh1g),'b');
hold on;
plot(log10(rh1s),'g');
legend('Jacobi', 'Gauss-Seidel', 'SOR');
xlabel('Iteraciones');
ylabel('log(residuo)');
title('Matriz de 1000x1000 elementos');