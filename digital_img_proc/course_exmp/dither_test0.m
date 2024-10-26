% 4 methods for dithering
Gra = imread('Lenna.png');
Gra = rgb2gray(Gra);
%Gra = uint8(double(Gra)/15*255);
figure
imshow(Gra)
DiGra = dither_d44(Gra,1);
figure
imshow(DiGra)
title('dither d44 2*2');
DiGra = dither_d44(Gra,2);
figure
imshow(DiGra)
title('dither d44 4*4');
DiGra = dither_d44(Gra,3);
figure
imshow(DiGra)
title('rand 512');
DiGra = dither_d44(Gra,4);
figure
imshow(DiGra)
title('rand 4*4');
