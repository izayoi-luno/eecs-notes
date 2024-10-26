clc
clear
% to a specific root，
srcDic = uigetdir('./vid_CLAHE_DCP/videoDCPimgs');
cd(srcDic);
%read all jpg images
name1 = dir('*.jpg');
name2 = sort_nat({name1.name});
%allnames = struct2cell(name2);
[k,len]=size(name2);
aviobj = VideoWriter('driver.avi');
%frame rate
aviobj.FrameRate = 5;
open(aviobj)
%video made up by 179 images(the size of the structure)
for i = 1:179
    name = name2{1,i};
    frame = imread(name);
    writeVideo(aviobj,frame);
end
close(aviobj)


