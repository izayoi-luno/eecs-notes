%exercise 4.3
load splat
y=y(1:8192);
N=8192;
fs=8192;
%4.3_a
Y=fftshift(fft(y));
w=[-pi:2*pi/N:pi-pi/N]*fs;
Y0=abs(Y);
plot(Y0);
title('The figure of the magnitude of Y')
%4.3_b
Y1=conj(Y);
y1=ifft(fftshift(Y1));
y1=real(y1);
%sound(y1,fs);
%4.3_c
Y2=abs(Y);%the amplitude of Y 
Y3=exp(1i*angle(Y));%the phase of Y
y2=ifftshift(fft(Y2));
y3=ifftshift(fft(Y3));
%4.3_d
y2=real(y2);
%sound(y2,fs);
%4.3_e
y3=real(y3);
%sound(y3,fs);
sound(y,fs);