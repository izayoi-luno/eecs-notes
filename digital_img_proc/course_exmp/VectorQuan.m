%Vector Quanization
%

%------- generate my codebook -------------------
%  the same codewords as used in halftoning
V(:,:,1) = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
V(:,:,2) = [0 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 0];
V(:,:,3) = [0 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 0];
V(:,:,4) = [0 0 0 0; 0 1 0 0; 0 0 1 0; 0 1 0 0];
V(:,:,5) = [0 0 1 0; 0 1 0 0; 0 0 1 0; 0 1 0 0];
V(:,:,6) = [0 0 1 0; 0 1 0 1; 0 0 1 0; 0 1 0 0];
V(:,:,7) = [0 0 1 0; 0 1 0 1; 1 0 1 0; 0 1 0 0];
V(:,:,8) = [0 1 1 0; 0 1 0 1; 1 0 1 0; 0 1 0 0];
V(:,:,9) = [0 1 1 0; 0 1 0 1; 1 0 1 0; 0 1 1 0];
V(:,:,10) = [0 1 1 0; 0 1 0 1; 1 0 1 0; 1 1 1 0];
V(:,:,11) = [0 1 1 0; 1 1 0 1; 1 0 1 0; 1 1 1 0];
V(:,:,12) = [0 1 1 0; 1 1 0 1; 1 0 1 1; 1 1 1 0];
V(:,:,13) = [1 1 1 0; 1 1 0 1; 1 0 1 1; 1 1 1 0];
V(:,:,14) = [1 1 1 0; 1 1 1 1; 1 0 1 1; 1 1 1 0];
V(:,:,15) = [1 1 1 0; 1 1 1 1; 1 1 1 1; 1 1 1 0];
V(:,:,16) = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
%=======================================================

%------ codewords similar to haar features-------------
% V(:,:,1) = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
% V(:,:,2) = [0 0 0 0; 0 0 0 0; 1 1 1 1; 1 1 1 1];
% V(:,:,3) = [0 0 1 1; 0 0 1 1; 0 0 1 1; 0 0 1 1];
% V(:,:,4) = [0 0 0 0; 1 0 0 0; 1 1 0 0; 1 1 1 0];
% V(:,:,5) = [0 0 0 0; 0 0 0 1; 0 0 1 1; 0 1 1 1];
% V(:,:,6) = [1 1 1 1; 0 0 1 1; 0 0 0 0; 0 0 0 0];
% V(:,:,7) = [0 0 0 0; 0 0 0 0; 0 0 1 1; 1 1 1 1];
% V(:,:,8) = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0];
% V(:,:,9) = [1 1 1 1; 1 0 0 1; 1 0 0 1; 1 1 1 1];
% V(:,:,10) = [1 1 1 1; 1 1 1 1; 1 1 0 0; 0 0 0 0];
% V(:,:,11) = [0 0 0 0; 1 1 0 0; 1 1 1 1; 1 1 1 1];
% V(:,:,12) = [1 1 1 1; 1 1 1 0; 1 1 0 0; 1 0 0 0];
% V(:,:,13) = [1 1 1 1; 0 1 1 1; 0 0 1 1; 0 0 0 1];
% V(:,:,14) = [1 1 0 0; 1 1 0 0; 1 1 0 0; 1 1 0 0];
% V(:,:,15) = [1 1 1 1; 1 1 1 1; 0 0 0 0; 0 0 0 0];
% V(:,:,16) = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
%=====================================================

figure % show all the codewords in my codebook
for i = 1:16
    subplot(4,4,i)
    imshow(V(:,:,i))
    pause
end

A = imread('Lenna.png');

Gra = rgb2gray(A);    % for color image, convert to gray image first
% Gra =A;
Gra = imresize(Gra,0.25);
 figure
 imshow(Gra)
 title('Original');
 
QGra = zeros(size(Gra));  %Quantized Gray Image
Ro = size(Gra,1);Co = size(Gra,2);  % Ro and Co must be integers of 2^n
Rv = size(V,1);Cv = size(V,2);Dv = size(V,3);

% --------------- perform VQ block by block --------------
for i = 1:Rv:Ro
    for j = 1:Cv:Co
        Temp1 = im2double(Gra(i:i+Rv-1,j:j+Cv-1));
        % cell(i,j) of the original image
        mindis = 100000;
        ind = 1;

        for k = 1:Dv  % searching for the closest codeword in the codebook
            Temp2 = V(:,:,k);
            dis = sum(sum(sqrt((Temp1 - Temp2).^2))); % Euclidean distance
            if(dis < mindis)
                mindis = dis;
                ind = k;
            end
        end
        QGra(i:i+Rv-1,j:j+Cv-1) = V(:,:,ind);
    end
end
% =======================================================

figure
imshow(QGra)
title('VQ2');