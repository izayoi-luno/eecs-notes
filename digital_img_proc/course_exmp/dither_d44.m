function y=dither_d44(x,ind)
% This function provides different dither matrices 
% for an uint8 matrix x of size 512*512.
switch (ind)
    case 1
        D=[0 128 ;192 64];
    case 2
        D = [8 136 40 168;200 72 232 104;56 184 24 152;248 120 216 88];
    case 3
        %D = floor((randn(512))*128+127);  % Generate a matrix with values
% from a normal distribution with mean 127 and standard deviation 128
        D = floor((rand(512))*255);   % Generate a matrix with values 
% from the uniform distribution in the range of [0, 255]
    otherwise
        %D = floor((randn(4))*128+127)
        D = floor((rand(4))*255);
end
nr = size(D,1);
nc = size(D,2);
M = size(x,1);
N = size(x,2);
%

%D = floor((randn(512)+1)*128);

r=repmat(D,M/nr,N/nc);
y=x>=r;