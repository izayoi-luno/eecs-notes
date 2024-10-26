clear all
fs=1028;
N=1028;%sampling points
Nn=514;%dft length
n=0:N-1;
t=[0:1/fs:(N-1)/fs];
M=514;%length of window
m=0:M-1;
x1=10*sin(2*pi*64*t)+sin(2*pi*250*t)+20*sin(2*pi*256*t)+3*sin(2*pi*260*t)+10*sin(2*pi*512*t);
subplot(2,1,1)
plot(n/N,x1);
title('original sampled signal')
xlabel('time domain n')
ylabel('magnitude')
grid

X1=abs(fft(x1,N));
subplot(2,1,2)
stem(X1);
title('dft of original signal');
xlabel('frequency domain k')
ylabel('magnitude')
grid