%aliasing one D
clear
close all
N = 5;
a = -1;b = 1;
mfreqx = 2;
stepx = (b-a)/N;
dsstep = 0.01;

disp('freq x max : ')
mfreqx
disp('freq x sampling : ')
1/stepx
e = 0.000001;
x = a:stepx:b-e;
y = zeros(1,N);

for i = 1:N
    y(i) = sin(2*pi*(mfreqx*x(i)));
end
scatter(x,y,'go','filled');
hold on;
dsx = a:dsstep:b;
dsy = sin(2*pi*(2*dsx));
plot(dsx,dsy)
axis([dsx(1) dsx(end) -1.5 1.5])
%----------------- reconstruct -------------------
steprx = dsstep;
xx = a:steprx:b;
Ry = zeros(1,length(xx));
dispInt = floor(length(xx)/10);
for i = 1:length(xx)
        % reconstruct for one point
        for k = 1:N
           Ry(i) = Ry(i) + y(k)*sinc(xx(i)/stepx - k + N/2 + 1);
        end
    if(mod(i,dispInt) == 0)
        floor(i/dispInt);
    end
end
%figure
pause
plot(xx,Ry,'r')
pause
figure
plot(xx,abs(dsy - Ry))
axis([dsx(1) dsx(end) 0 1.5])