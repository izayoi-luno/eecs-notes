clc
clear all

I1=imread('./data/IEI2019/H76.jpg');  %原图
I1=double(rgb2gray(uint8(I1)));

[nl,nc]=size(I1);

R1=imread('./data/DCP/H76.jpg');    %结果图
%R1=imread('./data/CLACH/H76.jpg');    %结果图
R1=double(rgb2gray(uint8(R1)));

%%%% Contrast Computation at 5%
tic
[C1 Crr1]=functionContrastAt5PerCent(R1);
[Ci Crri]=functionContrastAt5PerCent(I1);
toc

minCrri=min(Crri(:));
maxCrri=max(Crri(:));

%%%% Sobel Gradient
Sy = double([1 2 1;0 0 0;-1 -2 -1]);
GIy = imfilter(I1,Sy,'symmetric');
GRy1 = imfilter(R1,Sy,'symmetric');

Sx = double([1 0 -1; 2 0 -2; 1 0 -1]);
GIx = imfilter(I1,Sx,'symmetric');
GRx1 = imfilter(R1,Sx,'symmetric');

GI=sqrt((GIx.^2)+(GIy.^2));
GR1=sqrt((GRx1.^2)+(GRy1.^2));

%%%% Visible Gradients Ratio
Cratio1=zeros(nl,nc);
Cratio1(Crr1>0)=GR1(Crr1>0)./GI(Crr1>0);

% Rate of new visible edges
whitePixels1=sum(C1(:));
whitePixelsi=sum(Ci(:));
e=(whitePixels1-whitePixelsi)/whitePixelsi;

% Number of saturated pixels after restoration
ns1=sum(R1(:)==256 |R1(:)==0);
ns1=ns1/(nl*nc);
sigma=ns1*100;

% Restoration quality (geometric mean ratios of visibility level)
XX=log(Cratio1);
r=exp((1/(whitePixels1))*nansum(XX(isfinite(XX))));
[e,sigma,r]