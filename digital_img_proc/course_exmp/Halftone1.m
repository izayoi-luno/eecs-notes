%Halftone
clear
close all
% ---------------- generate my codebook -----------
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
% ====================================================
figure   % show all the codewords in my codebook 
for i = 1:16
    subplot(4,4,i)
    imshow(V(:,:,i))
    pause
end

A = imread('Lenna.png');
Gra = rgb2gray(A);   % for color image, convert to gray image first 
%Gra = A;
QGra = zeros(size(Gra));
Ro = size(Gra,1);Co = size(Gra,2);  % Ro and Co must be integers of 2^n
Rv = size(V,1);Cv = size(V,2);Dv = size(V,3);

% --------------- perform halftoning block by block ----------
for i = 1:Rv:Ro
    for j = 1:Cv:Co
        Temp1 = im2double(Gra(i:i+Rv-1,j:j+Cv-1));
       
        ind = 1;
        
        for k = 1:Dv
            Temp2 = (k-1)/(Dv-1); % The ratio of the # of white pixels to 
                                  % the total # of pixels in a codeword.
            dis = mean2(Temp1);   % The average gray level in an image block.
            if(dis <= Temp2)      % Finding the codeword that is the closest 
                ind = k;          % to an image block in the sense of 
                break;            % average intensity.
            end
        end
        QGra(i:i+Rv-1,j:j+Cv-1) = V(:,:,ind);
    end
end
% =======================================================

figure
imshow(Gra)
title('Original');
figure
imshow(QGra)
title('HalfTone');