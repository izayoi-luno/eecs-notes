%exercise 10.2(a)
b1=[1];
a1=[1 -0.9 0.81];
zs=roots(b1);
ps=roots(a1);
plot(real(zs),imag(zs),'o');
hold on
plot(real(ps),imag(ps),'x');
grid
axis([-3 3 -3 3]);
title('poles and zeros for H1')