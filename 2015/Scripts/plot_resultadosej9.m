plot(x,y,'d')
hold on
plot((-0.5:0.001:2.5),a1*(-0.5:0.001:2.5)+a0,'r')
xlabel('Deformaci�n [mm]');
ylabel('Tensi�n [MPa]');
legend('Deformaciones por test y tensi�n','Recta aproximante')
