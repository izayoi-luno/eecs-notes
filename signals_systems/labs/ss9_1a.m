%exercise 9.1(a)
b1=[1 5];
a1=[1 2 3];
b2=[2 5 12];
a2=[1 2 10];
b3=[2 5 12];
a3=[1 4 14 20];%define H1, H2 and H3

zs1=roots(b1);
ps1=roots(a1);
zs2=roots(b2);
ps2=roots(a2);
zs3=roots(b3);
ps3=roots(a3);%find the roots of H1,2,3

subplot(3,1,1)
plot(real(zs1),imag(zs1),'o');
hold on
plot(real(ps1),imag(ps1),'x');
grid
axis([-3 1 -5 5]);

subplot(3,1,2)
plot(real(zs2),imag(zs2),'o');
hold on
plot(real(ps2),imag(ps2),'x');
grid
axis([-3 1 -5 5]);

subplot(3,1,3)
plot(real(zs3),imag(zs3),'o');
hold on
plot(real(ps3),imag(ps3),'x');
grid
axis([-3 1 -5 5]);