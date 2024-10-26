%exercise 3.9
t=linspace(0,20,1000);
b=[0,1];
a=[1,1];
x=cos(t);
y=lsim(b,a,x,t);
subplot(3,1,1);
plot(y);
title("the output y");
subplot(3,1,2);
plot(x);
title("the input x");

x2=cos(t);
x2=sign(cos(t));
y2=lsim(b,a,x2,t);
subplot(3,1,3);
plot(y2);
title("the output y2");