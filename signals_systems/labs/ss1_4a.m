% exercise 1.4(a)

nx=-90:1:90;
x1=[zeros(1,90) 1 zeros(1,90)];
y1=sin(pi*(x1)/2);

x2=[zeros(1,90) 2 zeros(1,90)];
y2=sin(pi*x2/2);

x3=3*x1+2*x2;
y3_1=3*y1+2*y2;
y3_2=sin(pi*(x3)/2); %to check whether y3_1 equals to y3_2

subplot(2,1,1);
stem(nx,y3_1)
title('y3_1')
xlabel('n')
ylabel('y3_1')
subplot(2,1,2);
stem(nx,y3_2)
title('y3_2')
xlabel('n')
ylabel('y3_2')