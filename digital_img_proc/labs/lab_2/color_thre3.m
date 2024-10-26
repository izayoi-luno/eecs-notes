%%
% namelist = dir(strcat(Input_path,'*.jpg'));  
% len = length(namelist);
% namelist2 = sort_nat({namelist.name});
% for i = 1:len
%     name = namelist2{1,i};
%     image = imread(strcat(Input_path, name)); 

    % Read the images
    image = imread('./produce3/208.jpg');
    I = rgb2hsv(image);
    %%
    % Define thresholds for channel 1 based on histogram settings
    channel1Min = 0.773;
    channel1Max = 0.938;
    
    % Define thresholds for channel 2 based on histogram settings
    channel2Min = 0.393;
    channel2Max = 0.775;
    
    % Define thresholds for channel 3 based on histogram settings
    channel3Min = 0.339;
    channel3Max = 0.824;
    
    % Create mask based on chosen histogram thresholds
    sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
        (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
        (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
    BW = sliderBW;
    % Initialize output masked image based on input image.
    maskedRGBImage = image;
    
    % Set background pixels where BW is false to zero.
    maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
    
    %%
    % Fill the holes
    BW2 = imfill(BW,"holes");
    
    % Erode the blobs
    SE = strel("disk",5);
    BW3 = imerode(BW2,SE);
    
    % Find adjacent regions
    [L,num] = bwlabel(BW3,8);
    % disp(num);
    figure(1)
    imshow(L);
    
    %%
    % Obtain information of the adjacent regions
    stats = regionprops(BW3, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); % Calculate characteristics of the regions
    centroids = cat(1, stats.Centroid);
    
    
    % Label and Rectangle the blobs
    noiseArea=7000;
    fh = figure(2);
    imshow(image,'border', 'tight')
    hold on
    % for j=1:size(stats)
    %     area = stats(j).Area;                                   % Area value for each region
    %     if area<noiseArea                                       % Set zero for small regions
    %         pointList = stats(j).PixelList;                     % Pixel position for each position of each region
    %         rIndex=pointList(:,2);
    %         cIndex=pointList(:,1);
    %         pointList = stats(j).PixelList;                     % Pixel position for each adjacent region
    %         BW3(rIndex,cIndex)=0;                            % Set small regions to be zero
    %     end
    % end
    for j=1:size(stats)
        area = stats(j).Area;                                   % Area value for each region
        if area>=noiseArea
            rectangle('Position',[stats(j).BoundingBox],'LineWidth',2,'LineStyle','-','EdgeColor','g'),
            plot(centroids(j,1), centroids(j,2), 'g*');             % Centroid position for each region
        end
        hold on
        %     saveas(gcf,sprintf('img/%d',i),'jpg')                   % Save the image
    end
    frm = getframe( fh ); % get the image+rectangle
    imwrite( frm.cdata,'./test.jpg');
    % imwrite( frm.cdata,[Output_path,int2str(i),'.jpg']); % save to file
    hold off
    
    
    % Draw rectangle
    % fh = figure;
    % imshow(image,'border', 'tight');
    % hold on;
    % rectangle('Position', [744 844 200 300], 'EdgeColor','g'); % from x, from y, width, hight
    % frm = getframe( fh ); % get the image+rectangle
    % imwrite( frm.cdata, './128.jpg' ); % save to file
% end