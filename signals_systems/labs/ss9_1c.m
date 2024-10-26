%exercise 9.1(c)
b=[1 2 5];
a=[0 1 -3];
zs=roots(b);
ps=roots(a);
plot(real(zs),imag(zs),'o');
hold on
plot(real(ps),imag(ps),'x');
grid
axis([-3 3 -3 3]);