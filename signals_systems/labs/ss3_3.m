%exercise 3.3
b1=[1,-2];
a1=[1,2];

b2=[0,3];
a2=[1,0.3];

b3=[2,0];
a3=[1,0.8];

t=[0:0.1:0.5];
x=cos(t);

y1=lsim(b1,a1,x,t);
y2=lsim(b2,a2,x,t);
y3=lsim(b3,a3,x,t);