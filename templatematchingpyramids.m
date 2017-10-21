close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\a3.jpg');
T = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\1instance\q08.ppm');

figure,imshow(I),title('Original Image');
figure,imshow(T),title('Template Image');

I_db = im2double(I);
T_db = im2double(T);

channToCorr = 1;  % Use the red channel.
figure,imshow(I),title('Scale Invariant Template Matched Image');
hold on; % Don't allow rectangle to blow away image.
for x = -1:1
    T_temp = T_db;
    if x<0 %reduce the template by 1 level
        T_temp = impyramid(T_temp, 'reduce');
    elseif x == 0
        T_temp = T;
    else %expand  the template by 1 level
        T_temp = impyramid(T_temp, 'expand');
    end
    [I_x,I_y] = size(I_db(:,:,1));
    [T_x,T_y] = size(T_temp(:,:,1));
    %Compute the cross correlation matrix
    correlationOutput = normxcorr2(T_temp(:,:,channToCorr),I_db(:,:,channToCorr));
    correlationOutput = mat2gray(correlationOutput);
    threshold= 0.95;
    % Find out where the normalized cross correlation image is brightest.
    while max(abs(correlationOutput(:)))>threshold
        [maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
        [yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
        % Because cross correlation increases the size of the image due to padding,
        % we need to shift back to find out where it would be in the original image.
        corr_offset = [(xPeak-size(T_temp,2)) (yPeak-size(T_temp,1))];
        % Plot it over the original image.
        % Calculate the rectangle for the template box.  Rect = [xLeft, yTop, widthInColumns, heightInRows]
        boxRect = [corr_offset(1)+1 corr_offset(2)+1 T_x T_y];
        rectangle('position', boxRect, 'edgecolor', 'b', 'linewidth',1.5);
        %Replace the vicinity of the maximum value with zero
        for k = xPeak-4:xPeak+4
           for l = yPeak-4:yPeak+4
               correlationOutput(l,k)=0;
           end
        end
    end
end