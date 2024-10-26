% exercise 1.2(d)

n=0:1:31;
x1=(sin(pi*n/4)).*(cos(pi*n/4));
subplot(3,1,1)
stem(n,x1) %to plot the graph of x1
title('x1=sin(pi*n/4).*cos(pi*n/4)')
xlabel('n')
ylabel('x1[n]')

x2=(cos(pi*n/4)).^2;
subplot(3,1,2)
stem(n,x2) %to plot the graph of x2
title('x2=(cos(pi*n/4))^2')
xlabel('n')
ylabel('x2[n]')

x3=(sin(pi*n/4)).*(cos(pi*n/8));
subplot(3,1,3)
stem(n,x3) %to plot the graph of x3
title('x3=sin(pi*n/4).*cos(pi*n/8)')
xlabel('n')
ylabel('x3[n]')