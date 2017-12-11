
[A2,b2,x2]=make_matrix(250)
[A5,b5,x5]=make_matrix(500);
[A10,b10,x10]=make_matrix(1000);

[t2,d2,l2,u2,rho2]=make_t(A2,2,0.9);
[t5,d5,l5,u5,rho5]=make_t(A5,2,0.9);
[t10,d10,l10,u10,rho10]=make_t(A10,2,0.9);

[x2sol, nit2, rh2, time2]=gauss_seidel(A2,b2,x2,100,1e-5);
[x5sol, nit5, rh5, time5]=gauss_seidel(A5,b5,x5,100,1e-5);
[x10sol, nit10, rh10, time10]=gauss_seidel(A10,b10,x10,100,1e-5);

log_plot(rh2,"Gauss-Seidel 250x250");
log_plot(rh5,"Gauss-Seidel 500x500");
log_plot(rh10,"Gauss-Seidel 1000x1000");

tic();[x] = gauss(A10,b10);toc()
tic();[x] = gauss(A5,b5);toc()
tic();[x] = gauss(A2,b2);toc()
