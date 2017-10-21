close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\1instance\a2.jpg');
T = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\1instance\q11.ppm');

figure,imshow(I),title('Original Image');
figure,imshow(T),title('Template Image');

I_db = im2double(I);
T_db = im2double(T);
[I_x,I_y] = size(I_db(:,:,1));
[T_x,T_y] = size(T_db(:,:,1));

channelToCorrelate = 1;  % Use the red channel.
%Compute the cross correlation matrix
correlationOutput = normxcorr2(T_db(:,:,channelToCorrelate),I_db(:,:,channelToCorrelate));
figure, surf(correlationOutput), shading flat,title('Normalized cross correlation');
correlationOutput = correlationOutput(T_x/2:end-T_x/2,(T_y+1)/2:end-(T_y+1)/2+1);
correlationOutput = mat2gray(correlationOutput);
figure,imshow(correlationOutput),title('Normalized cross correlation output');
    
% Find out where the normalized cross correlation image is brightest.
[maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
[yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
% Because cross correlation increases the size of the image due to padding, 
% we need to shift back to find out where it would be in the original image.
corr_offset = [(xPeak-size(T,2)/2) (yPeak-size(T,1)/2)];
% Plot it over the original image.
figure,imshow(I),title('Template matched Image');
%axis on; % Show tick marks giving pixels
hold on; % Don't allow rectangle to blow away image.
% Calculate the rectangle for the template box.  Rect = [xLeft, yTop, widthInColumns, heightInRows]
boxRect = [corr_offset(1) corr_offset(2) T_x T_y];
rectangle('position', boxRect, 'edgecolor', 'y', 'linewidth',1.5);



              