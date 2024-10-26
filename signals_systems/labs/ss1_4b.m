%exercise 1.4(b)

nx=[-5:9];
x1=[zeros(1,5) ones(1,10)];
x2=[zeros(1,4) ones(1,11)];
nx=[-6:9];
y=[0 x1+x2];

stem(nx,y) %y is causal only if when n<0, y=0
title('y')
xlabel('n')
ylabel('y')