win1=hamming(M);%use hamming window
for i=1:M
   y1(i,1)=x1(1,i)*win1(i,1); 
end
subplot(4,1,1)
plot(m/M,y1);
title('hamming windowed signal')
xlabel('time domain n')
ylabel('magnitude')
grid

win2=boxcar(M);%use rectangular window
for i=1:M
   y2(i,1)=x1(1,i)*win2(i,1); 
end
subplot(4,1,2)
plot(m/M,y2);
title('rectangular windowed signal')
xlabel('time domain n')
ylabel('magnitude')
grid

win3=hanning(M);%use hanning window
for i=1:M
   y3(i,1)=x1(1,i)*win3(i,1); 
end
subplot(4,1,3)
plot(m/M,y3);
title('hanning windowed signal')
xlabel('time domain n')
ylabel('magnitude')
grid

win4=blackman(M);%use blackman window
for i=1:M
   y4(i,1)=x1(1,i)*win4(i,1); 
end
subplot(4,1,4)
plot(m/M,y4);
title('blackman windowed signal')
xlabel('time domain n')
ylabel('magnitude')
grid


