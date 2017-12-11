t0=0:0.001:1;
t1=1:0.001:2;
t2=2:0.001:3;
t3=3:0.001:4;

Sx0=0+0*(t0-0)+1.5*(t0-0).^2+0*(t0-0).^3;
Sx1=1.5+3*(t1-1)+1.5*(t1-1).^2-2*(t1-1).^3;
Sx2=4+0*(t2-2)+0*(t2-2).^2-1*(t2-2).^3;
Sx3=3-3*(t3-3)-3*(t3-3).^2+3*(t3-3).^3;

Sy0=0+0*(t0-0)+5.25*(t0-0).^2-2.25*(t0-0).^3;
Sy1=3+3.75*(t1-1)-1.5*(t1-1).^2-0.25*(t1-1).^3;
Sy2=5+0*(t2-2)-8.25*(t2-2).^2+4.25*(t2-2).^3;
Sy3=1-3.75*(t3-3)+4.5*(t3-3).^2-1.75*(t3-3).^3;

figure(1)
plot(Sx0,Sy0,'b','LineWidth',2)
hold on;
plot(Sx1,Sy1,'r','LineWidth',2)
hold on;
plot(Sx2,Sy2,'k','LineWidth',2)
hold on;
plot(Sx3,Sy3,'g','LineWidth',2)
legend('S0','S1','S2','S3')
xlabel('x(t)')
ylabel('y(t)')

figure(2)
plot(t0,Sx0,'b','LineWidth',2)
hold on;
plot(t1,Sx1,'r','LineWidth',2)
hold on;
plot(t2,Sx2,'k','LineWidth',2)
hold on;
plot(t3,Sx3,'g','LineWidth',2)
xlabel('t  en segundos')
ylabel('x(t)')

figure(3)
plot(t0,Sy0,'b','LineWidth',2)
hold on;
plot(t1,Sy1,'r','LineWidth',2)
hold on;
plot(t2,Sy2,'k','LineWidth',2)
hold on;
plot(t3,Sy3,'g','LineWidth',2)
xlabel('t en segundos')
ylabel('y(t)')