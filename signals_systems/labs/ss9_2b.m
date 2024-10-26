%exercise 9.2(b)
b=[1];
a1=[1 0 1];
a2=[1 0.5 1];
a3=[1 2 1];
a4=[1 4 1];

omega=[-5:0.1:5];
H1=freqs(b,a1,omega);
H2=freqs(b,a2,omega);
H3=freqs(b,a3,omega);
H4=freqs(b,a4,omega);

subplot(4,1,1)
plot(real(H1));
title('real part of H1');
subplot(4,1,2)
plot(real(H2));
title('real part of H2');
subplot(4,1,3)
plot(real(H3));
title('real part of H3');
subplot(4,1,4)
plot(real(H4));
title('real part of H4');
