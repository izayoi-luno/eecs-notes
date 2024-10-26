%exercise 7.1(a)to(d)
n=[0:8191];
T=1/8192;
t=n*T;
omega0=2*pi*2000;%define n,T,t and Ω0

x=sin(omega0*n*T);
subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('x');
title('x versus n');

subplot(3,1,2);
plot(t,x);
xlabel('t');
ylabel('x');
title('x versus t');

[X,w]=ctfts(x,T);%to use function ctfts to calculate the FT
figure;
subplot(3,1,3);
plot(w,abs(X));
xlabel('w');
ylabel('|X|');
title('The magnitude of X versus w');

function [X,w]=ctfts(x,T)
N=length(x);
X=fftshift(fft(x,N))*(2*pi/N);
w=linspace(-1,1-1/N,N)/(2*T);
end
