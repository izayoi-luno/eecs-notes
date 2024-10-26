%exercise 9.2(a)(b)
b=[1];
a1=[1 0 1];
a2=[1 0.5 1];
a3=[1 2 1];
a4=[1 4 1];

ps1=roots(a1);
ps2=roots(a2);
ps3=roots(a3);
ps4=roots(a4);

subplot(4,1,1)
plot(real(ps1),imag(ps1),'x');
grid
axis([-5 0 -3 3]);
title('poles for H1')

subplot(4,1,2)
plot(real(ps2),imag(ps2),'x');
grid
axis([-5 0 -3 3]);
title('poles for H2')

subplot(4,1,3)
plot(real(ps3),imag(ps3),'x');
grid
axis([-5 0 -3 3]);
title('poles for H3')

subplot(4,1,4)
plot(real(ps4),imag(ps4),'x');
grid
axis([-5 0 -3 3]);
title('poles for H4')