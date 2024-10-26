%exercise 2.1c

nx=[0:5];
nh=[0:5];
ny=[0:10];

x=[ones(1,6)];
h=[0 1 2 3 4 5];
y1=[zeros(1,11)];

%analyzing method
for i=1:6
    for k=1:i
    y1(i)=y1(i)+h(k);
    end
end

for j=7:11
    for k=j-5:6
        y1(j)=y1(j)+h(k)
    end
end

subplot(2,1,1);
stem(ny,y1);
xlabel('n');ylabel('y1');
title('Graph of analyzing method');

y2=conv(h,x);%the convolution function
subplot(2,1,2);
stem(ny,y2);
xlabel('n');ylabel('y2');
title('Graph of the function y2=conv(h,x)');