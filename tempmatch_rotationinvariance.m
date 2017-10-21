close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\1instance\a2.jpg');
T = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\1instance\q06.ppm');

figure,imshow(I),title('Original Image');
figure,imshow(T),title('Template Image');

I_db = im2double(I);
T_db = im2double(T);
[I_x,I_y] = size(I_db(:,:,1));
[T_x,T_y] = size(T_db(:,:,1));
figure,imshow(I),title('Template matched Image');
%axis on; % Show tick marks giving pixels
hold on; % Don't allow rectangle to blow away image.
step=5;
for rotation=0:step:360
    T_tem=imrotate(T_db,rotation,'bilinear','crop');
    channelToCorrelate = 1;  % Use the red channel.
    %Compute the cross correlation matrix
    correlationOutput = normxcorr2(T_tem(:,:,channelToCorrelate),I_db(:,:,channelToCorrelate));
    correlationOutput = mat2gray(correlationOutput);
    threshold= 0.95;
    % Find out where the normalized cross correlation image is brightest.
    if max(abs(correlationOutput(:)))>threshold
        [maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
        [yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
        % Because cross correlation increases the size of the image due to padding,
        % we need to shift back to find out where it would be in the original image.
        corr_offset = [(xPeak-size(T,2)) (yPeak-size(T,1))];
        % Plot it over the original image.
        % Calculate the rectangle for the template box.  Rect = [xLeft, yTop, widthInColumns, heightInRows]
        boxRect = [corr_offset(1)+1 corr_offset(2)+1 T_x T_y];
        rectangle('position', boxRect, 'edgecolor', 'b', 'linewidth',1.5);
        %Replace the vicinity of the maximum value with zero
    end
end


