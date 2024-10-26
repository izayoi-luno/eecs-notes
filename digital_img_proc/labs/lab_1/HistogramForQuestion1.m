% hitograms of grayscale
f=imread('./data/IEI2019/R1.jpg');

%the original image
subplot(1,2,1);
imshow(f);
title('original image');

subplot(1,2,2);
imhist(f);
title('histogram');
h = imhist(f);
h1 = h(1:10:256);
horz = 1:10:256;%to draw a column by every 10 intensities
bar(horz,h1);
axis([0 255 0 230000]);%to set the maximum value of x and y axes
set(gca,'xtick',0:50:255);%x axis is set from 0 to 255 marked by 50 each
%set(gca,'ytick',0:1000:20000);%1000 each
