% Example of some basic image operations including
% how to read/write/display/crop an image.

% First, you need to have an image under your current folder
% or you have to give the FULL path of that image before reading it
% using imread()

OriginalImage = imread('Lenna.png');

imshow(OriginalImage);

CroppedImage = imcrop(OriginalImage); % This operation requires your 
                                      % interaction using the mouse
                                      
imwrite(CroppedImage,'ImagePatch.bmp','BMP'); % Use help cmd for more
                                          % supported image types

RedChannelImage = OriginalImage(:,:,1);
GreenChannelImage = OriginalImage(:,:,2);
BlueChannelImage = OriginalImage(:,:,3);
Diff_RedGreen = RedChannelImage - GreenChannelImage; % This term is
% always nonnegative for uint8, but could be negative for double, in
% that case, use abs() to get the absolute value.

figure
subplot(2,2,1)
imshow(RedChannelImage)
title('Red Channel')
subplot(2,2,2)
imshow(GreenChannelImage)
title('Green Channel')
subplot(2,2,3)
imshow(BlueChannelImage)
title('Blue Channel')
subplot(2,2,4)
imshow(Diff_RedGreen)
title('Difference between R and G')