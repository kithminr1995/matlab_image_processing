clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im03small.png');
figure;
imshow(I);
title('Original Image');

I_hsv = rgb2hsv(I);        % Get the hue, saturation and brightness of the image. 
I_v = I_hsv(:,:,3);         % Only the brightness value is dealt with in histogram equalization
I_v = im2uint8(I_v);
L = 256;

cum_hist_n = zeros(L, 1);       % generation of an array with zeros
for k = 1 : L
    cum_hist_n(k) = sum(sum(I_v < k)) ;     % Cumulative number of pixels of different brightness value is stored in the array
end
[m, n] = size(I_v);     % Height and width of the image returns is used to get the probability of the cum_hist
cum_hist_prob = uint8(cum_hist_n*255/(m*n));
I_hist = cum_hist_n(2:L) - cum_hist_n(1:L-1);
I_eq = mat2gray (cum_hist_prob(I_v + 1)) ; 


I_hsv(:,:,3) = im2double(I_eq);         % Histogram equalized brightness value is fed back to the original image
I_histeq = hsv2rgb(I_hsv);      % RGB image is created from the HSV values

figure;
imshow(I_histeq);
title('Histogram Equalization');
imwrite(I_histeq,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Histo_Eq\im03small_histeqIW.png');