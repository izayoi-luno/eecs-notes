%exercise 2.2(g)

x2=[ones(1,6) zeros(1,5)];
h=[0 1 2 3 4 5];
y2=filter(h,1,x2);
stem([0:10],y2);
title('the output y2');
xlabel('n');
ylabel('y2');