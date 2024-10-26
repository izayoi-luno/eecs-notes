%exercise 2.2all
nx=[1:4];
x=[1 2 3 4];

a1=[1];
b1=[0.5 1 2];
y1=filter(b1,a1,x);

a2=[1 -0.8];
b2=[2];
y2=filter(b2,a2,x);

a3=[1 -0.8];
b3=[0 2];
y3=filter(b3,a3,x);

%2.2e
nx=[0:10];
ny=[0:10];
x=[ones(1,6) zeros(1,5)];%this is x(n) in vector form 
b4=[0 1 2 3 4 5];%this is h(n) in vector form
a4=[1];
y4=filter(b4,a4,x);
stem(ny,y4);
title('the output y4');
xlabel('n');
ylabel('y4')