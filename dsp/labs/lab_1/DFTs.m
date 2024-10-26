Y1=20*log(abs(fft(y1,Nn)));
subplot(4,1,1)
plot(Y1);
title('dft of hamming windowed signal');
xlabel('frequency domain k')
ylabel('magnitude')
grid

Y2=20*log(abs(fft(y2,Nn)));
subplot(4,1,2)
plot(Y2);
title('dft of rectangular windowed signal');
xlabel('frequency domain k')
ylabel('magnitude')
grid

Y3=20*log(abs(fft(y3,Nn)));
subplot(4,1,3)
plot(Y3);
title('dft of hanning windowed signal');
xlabel('frequency domain k')
ylabel('magnitude')
grid

Y4=20*log(abs(fft(y4,Nn)));
subplot(4,1,4)
plot(Y4);
title('dft of blackman windowed signal');
xlabel('frequency domain k')
ylabel('magnitude')
grid