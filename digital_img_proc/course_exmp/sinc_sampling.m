%aliasing
clear
close all
N = 9;
M = 3;
a = -1+0.01;b = 1+0.01;
mfreqx = 2;
mfreqy = 1;

stepx = (b-a)/N;
stepy = (b-a)/M;
dsstep = 0.1;

disp('freq [x y] max : ')
[mfreqx mfreqy]
disp('freq [x y] sampling : ')
[1/stepx 1/stepy]

e = 0.000001;
x = a:stepx:b-e;
y = a:stepy:b-e;
[X Y] = meshgrid(x,y);
z = sin(2*pi*(mfreqx*X+mfreqy*Y));
X = X';
Y = Y';
z = z';
% old
% z = zeros(N,M);
% for i = 1:N
%     for j = 1:M
%         z(i,j) = sin(2*pi*(2*x(i)+y(j)));
%     end
% end
figure
scatter3(X(:),Y(:),z(:),'k','filled')
hold on;
dsx = a:dsstep:b;
dsy = a:dsstep:b;
[dsX dsY] = meshgrid(dsx,dsy);
dsz = sin(2*pi*(mfreqx*dsX+mfreqy*dsY));
surf(dsX,dsY,dsz);
pause
%----------------- reconstruct -------------------
steprx = dsstep;
stepry = steprx;
xx = a:steprx:b;
yy = xx;
Rz = zeros(length(xx),length(yy));
dispInt = floor(length(xx)/10);
for i = 1:length(xx)
    for j = 1:length(yy)
        % reconstruct for one point
        for k = 1:N
            for l = 1:M
                Rz(i,j) = Rz(i,j) + z(k,l)*sinc(xx(i)/stepx - k + N/2 + 1)...
                          *sinc(yy(j)/stepy - l + M/2 + 1);
            end
        end
    end
    if(mod(i,dispInt) == 0)
        floor(i/dispInt);
    end
end
figure
surf(xx,yy,Rz')
figure
mesh(xx,yy,abs(dsz - Rz'))
colorbar